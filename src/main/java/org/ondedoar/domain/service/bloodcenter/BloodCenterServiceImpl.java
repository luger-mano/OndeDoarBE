package org.ondedoar.domain.service.bloodcenter;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.request.openstreet.GeolocationStartingPointRequestDto;
import org.ondedoar.adapter.response.address.NeighborhoodsBloodCentersResponseDto;
import org.ondedoar.adapter.response.address.NeighborhoodsZoneResponseDto;
import org.ondedoar.adapter.response.bloodcenter.BloodCenterResponseDto;
import org.ondedoar.adapter.response.bloodcenter.NearestBloodCenterResponseDto;
import org.ondedoar.adapter.response.openstreet.RouteResponseDto;
import org.ondedoar.domain.enums.Zone;
import org.ondedoar.domain.model.bloodcenter.BloodCenter;
import org.ondedoar.domain.model.bloodcenter.BloodCenterAddress;
import org.ondedoar.domain.model.bloodcenter.BloodCenterSpecifications;
import org.ondedoar.domain.repository.BloodCenterRepository;
import org.ondedoar.domain.service.osrm.OsrmRoutingService;
import org.ondedoar.utils.geo.GeoUtils;
import org.ondedoar.utils.mapper.BloodCenterMapper;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class BloodCenterServiceImpl implements BloodCenterService {

    private final BloodCenterMapper bloodCenterMapper;
    private final BloodCenterRepository bloodCenterRepository;
    private final OsrmRoutingService osrmRoutingService;
    private final String BUCKET_S3_URL_IMAGE = "https://blood-centers-images.s3.us-east-1.amazonaws.com/";

    @Override
    @Cacheable("bloodCenters")
    public List<BloodCenterResponseDto> getAllBloodCenters() {

        return bloodCenterRepository
                .findAllByOrderByNameAsc()
                .stream()
                .map(bloodCenter -> {
                    try {
                        BloodCenterResponseDto dto = bloodCenterMapper.bloodCenterToBloodCenterResponseDto(bloodCenter);
                        dto.setFacadeImageUrl(BUCKET_S3_URL_IMAGE + "bloodcenter.svg");

                        String operationRaw = bloodCenter.getOperation() != null ? bloodCenter.getOperation() : "";
                        String status = BloodCenterOpeningValidator.validate(operationRaw);
                        dto.setOperation(status);

                        return dto;
                    } catch (Exception e) {
                        System.err.println("Erro ao processar hemocentro ID: " + bloodCenter.getBloodCenterId());
                        e.printStackTrace();

                        BloodCenterResponseDto fallbackDto = bloodCenterMapper.bloodCenterToBloodCenterResponseDto(bloodCenter);
                        fallbackDto.setOperation("Unidade fechada | Verifique o site");
                        return fallbackDto;
                    }
                })
                .collect(Collectors.toList());
    }

    @Override
    @Cacheable("bloodCentersSearch")
    public List<BloodCenterResponseDto> getBloodCentersByAddressContainingIgnoreCase(String search) {

        Specification<BloodCenter> bloodCenterSpecification = BloodCenterSpecifications.searchByTerm(search);
        List<BloodCenter> centers = bloodCenterRepository.findAll(bloodCenterSpecification);

        return centers.stream()
                .map(bloodCenter -> {
                    BloodCenterResponseDto dto =
                            bloodCenterMapper.bloodCenterToBloodCenterResponseDto(bloodCenter);
                    dto.setFacadeImageUrl(BUCKET_S3_URL_IMAGE + "bloodcenter.svg");

                    String status = BloodCenterOpeningValidator.validate(bloodCenter.getOperation());
                    dto.setOperation(status);

                    return dto;
                }).collect(Collectors.toList());
    }

    @Override
    @Cacheable("bloodCentersGroupedByZone")
    public List<NeighborhoodsZoneResponseDto> getBloodCentersGroupedByRegiao(String regiao) {

        System.out.println("Buscando pela região: " + regiao);

        List<BloodCenter> bloodCenters = bloodCenterRepository.findAllByBloodCenterAddressRegiaoIgnoreCaseOrderByNameAsc(regiao);

        final Zone fallbackZone;
        if ("INTERIOR".equalsIgnoreCase(regiao)) {
            fallbackZone = Zone.INTERIOR;
        } else if ("METROPOLE".equalsIgnoreCase(regiao) || "METROPOLIS".equalsIgnoreCase(regiao)) {
            fallbackZone = Zone.METROPOLIS;
        } else {
            fallbackZone = Zone.CENTRO;
        }

        Map<Zone, Map<String, List<BloodCenter>>> grouped = bloodCenters.stream()
                .filter(bloodCenter -> {
                    BloodCenterAddress address = bloodCenter.getBloodCenterAddress();
                    return address != null;
                })
                .collect(Collectors.groupingBy(
                        bloodCenter -> {
                            Zone zone = bloodCenter.getBloodCenterAddress().getZone();

                            return zone != null ? zone : fallbackZone;
                        },
                        LinkedHashMap::new,
                        Collectors.groupingBy(bloodCenter -> {
                            String bairro = bloodCenter.getBloodCenterAddress().getBairro();

                            return (bairro != null && !bairro.isBlank())
                                    ? bairro
                                    : bloodCenter.getBloodCenterAddress().getMunicipio();
                        })
                ));

        return grouped.entrySet().stream()
                .map(zoneEntry -> {
                    NeighborhoodsZoneResponseDto zoneDto = new NeighborhoodsZoneResponseDto();
                    zoneDto.setZone(zoneEntry.getKey());

                    List<NeighborhoodsBloodCentersResponseDto> neighborhoods = zoneEntry.getValue()
                            .values()
                            .stream()
                            .map(centers -> {
                                BloodCenter firstCenter = centers.get(0);
                                NeighborhoodsBloodCentersResponseDto dto = bloodCenterMapper
                                        .bloodCenterToNeighborhoodResponseDto(firstCenter);

                                String neighborhoodName = firstCenter.getBloodCenterAddress().getBairro();
                                if (neighborhoodName == null || neighborhoodName.isBlank()) {
                                    dto.setBairro(firstCenter.getBloodCenterAddress().getMunicipio());
                                }

                                List<BloodCenterResponseDto> bloodCenterDtos = centers.stream()
                                        .map(bloodCenter -> {
                                            BloodCenterResponseDto responseDto = bloodCenterMapper
                                                    .bloodCenterToBloodCenterResponseDto(bloodCenter);
                                            responseDto.setFacadeImageUrl(BUCKET_S3_URL_IMAGE + "bloodcenter.svg");
                                            String status = BloodCenterOpeningValidator.validate(bloodCenter.getOperation());
                                            responseDto.setOperation(status);
                                            return responseDto;
                                        })
                                        .toList();

                                dto.setNeighborhoodImageUrl("https://blood-centers-images.s3.us-east-1.amazonaws.com/neighborhood.svg");
                                dto.setBloodCenters(bloodCenterDtos);
                                return dto;
                            })
                            .sorted(Comparator.comparing(NeighborhoodsBloodCentersResponseDto::getBairro, Comparator.nullsLast(String::compareTo)))
                            .collect(Collectors.toList());

                    zoneDto.setBairros(neighborhoods);
                    return zoneDto;
                })
                .sorted((z1, z2) -> {
                    boolean isZ1Centro = Zone.CENTRO.equals(z1.getZone());
                    boolean isZ2Centro = Zone.CENTRO.equals(z2.getZone());
                    if (isZ1Centro && !isZ2Centro) return -1;
                    if (!isZ1Centro && isZ2Centro) return 1;
                    return Integer.compare(z2.getBairros().size(), z1.getBairros().size());
                })
                .collect(Collectors.toList());
    }

    @Override
    @Cacheable(value = "nearestBloodCenters", key = "T(java.lang.String).format(T(java.util.Locale).US, '%.3f_%.3f', #startingPointRequestDto.latitudeStarting != null ? T(java.lang.Double).parseDouble(#startingPointRequestDto.latitudeStarting) : 0.0, #startingPointRequestDto.longitudeStarting != null ? T(java.lang.Double).parseDouble(#startingPointRequestDto.longitudeStarting) : 0.0)")
    public List<NearestBloodCenterResponseDto> getNearestBloodCenters(GeolocationStartingPointRequestDto startingPointRequestDto) {

        try {
            double startLat = Double.parseDouble(startingPointRequestDto.getLatitudeStarting());
            double startLon = Double.parseDouble(startingPointRequestDto.getLongitudeStarting());

            List<BloodCenter> bloodCenters = bloodCenterRepository.findAllByOrderByNameAsc();

            List<NearestBloodCenterResponseDto> nearestBloodCenters = bloodCenters.stream()
                    .filter(b ->
                            b.getBloodCenterAddress() != null
                                    && b.getBloodCenterAddress().getLatitude() != null
                                    && b.getBloodCenterAddress().getLongitude() != null)
                    .map(b -> {
                        String latStr = b.getBloodCenterAddress().getLatitude().replace(",", ".");
                        String longStr = b.getBloodCenterAddress().getLongitude().replace(",", ".");

                        double destLat = Double.parseDouble(latStr);
                        double destLon = Double.parseDouble(longStr);

                        double distLinear = GeoUtils.calculateHaversineDistance(startLat, startLon, destLat, destLon);

                        NearestBloodCenterResponseDto responseDto = new NearestBloodCenterResponseDto();
                        responseDto.setBloodCenterId(b.getBloodCenterId());
                        responseDto.setName(b.getName());
                        responseDto.setPhone(b.getPhone());
                        responseDto.setAddress(
                                bloodCenterMapper
                                        .bloodCenterAddressToAddressResponseDto(
                                                b.getBloodCenterAddress()));
                        responseDto.setOperation(b.getOperation());
                        responseDto.setFacadeImageUrl(BUCKET_S3_URL_IMAGE + "bloodcenter.svg");
                        responseDto.setLatitude(destLat);
                        responseDto.setLongitude(destLon);
                        responseDto.setDistanceKm(distLinear);

                        return responseDto;
                    })
                    .sorted(Comparator.comparingDouble(NearestBloodCenterResponseDto::getDistanceKm))
                    .limit(10)
                    .collect(Collectors.toList());

            List<CompletableFuture<Void>> futures = nearestBloodCenters.stream()
                    .map(bloodCenter -> CompletableFuture.runAsync(() -> {
                        RouteResponseDto routeResponseDto = osrmRoutingService.getRoute(
                                String.valueOf(startLat),
                                String.valueOf(startLon),
                                String.valueOf(bloodCenter.getLatitude()),
                                String.valueOf(bloodCenter.getLongitude())
                        );
                        if (routeResponseDto != null) {
                            bloodCenter.setDistanceKm((double) routeResponseDto.getDistance());
                            bloodCenter.setDurationSeconds(routeResponseDto.getDuration() * 60);
                        }
                    }))
                    .collect(Collectors.toList());

            CompletableFuture.allOf(futures.toArray(new CompletableFuture[0])).join();

            nearestBloodCenters.sort(Comparator.comparingDouble(NearestBloodCenterResponseDto::getDistanceKm));

            return nearestBloodCenters;
        } catch (Exception e) {
            log.error("Urgente: O erro 500 aconteceu aqui!", e);
            throw e;
        }
    }

}