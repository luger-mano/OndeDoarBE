package org.ondedoar.domain.service.bloodcenter;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.response.address.NeighborhoodsBloodCentersResponseDto;
import org.ondedoar.adapter.response.address.NeighborhoodsZoneResponseDto;
import org.ondedoar.adapter.response.bloodcenter.BloodCenterResponseDto;
import org.ondedoar.domain.enums.Zone;
import org.ondedoar.domain.model.bloodcenter.BloodCenter;
import org.ondedoar.domain.model.bloodcenter.BloodCenterAddress;
import org.ondedoar.domain.model.bloodcenter.BloodCenterSpecifications;
import org.ondedoar.domain.repository.BloodCenterRepository;
import org.ondedoar.utils.mapper.BloodCenterMapper;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class BloodCenterServiceImpl implements BloodCenterService {

    private final BloodCenterMapper bloodCenterMapper;
    private final BloodCenterRepository bloodCenterRepository;
    private final String BUCKET_S3_URL_IMAGE = "https://blood-centers-images.s3.us-east-1.amazonaws.com/";

    @Override
    @Cacheable("bloodCenters")
    public List<BloodCenterResponseDto> getAllBloodCenters() {


        return bloodCenterRepository
                .findAll()
                .stream()
                .map(bloodCenter -> {
                    BloodCenterResponseDto dto =
                            bloodCenterMapper.bloodCenterToBloodCenterResponseDto(bloodCenter);
                    dto.setFacadeImageUrl(BUCKET_S3_URL_IMAGE + "bloodcenter.svg");

                    String status = BloodCenterOpeningValidator.validate(bloodCenter.getOperation());
                    dto.setOperation(status);

                    return dto;
                })
                .collect(Collectors.toList());
    }

    @Override
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
    public List<NeighborhoodsZoneResponseDto> getBloodCentersGroupedByZone() {

        List<BloodCenter> bloodCenters = bloodCenterRepository.findAll();

        bloodCenters.forEach(bloodCenter -> {

            BloodCenterAddress address =
                    bloodCenter.getBloodCenterAddress();

            if (address == null) {
                System.out.println(
                        "Address null: " + bloodCenter.getName()
                );

            } else if (address.getZone() == null) {
                System.out.println(
                        "Zone null: " + bloodCenter.getName()
                );

            } else if (address.getBairro() == null) {
                System.out.println(
                        "Bairro null: " + bloodCenter.getName()
                );
            }
        });

        Map<Zone, Map<String, List<BloodCenter>>> grouped =
                bloodCenters.stream()

                        .filter(bloodCenter -> {
                            BloodCenterAddress address =
                                    bloodCenter.getBloodCenterAddress();

                            return address != null
                                    && address.getZone() != null
                                    && address.getBairro() != null;
                        })

                        .collect(Collectors.groupingBy(
                                bloodCenter ->
                                        bloodCenter.getBloodCenterAddress().getZone(),

                                Collectors.groupingBy(
                                        bloodCenter ->
                                                bloodCenter.getBloodCenterAddress().getBairro()
                                )
                        ));

        return grouped.entrySet()
                .stream()
                .map(zoneEntry -> {

                    NeighborhoodsZoneResponseDto zoneDto =
                            new NeighborhoodsZoneResponseDto();

                    zoneDto.setZone(zoneEntry.getKey());

                    List<NeighborhoodsBloodCentersResponseDto> neighborhoods =
                            zoneEntry.getValue()
                                    .values()
                                    .stream()
                                    .map(centers -> {

                                        BloodCenter firstCenter =
                                                centers.get(0);

                                        NeighborhoodsBloodCentersResponseDto dto =
                                                bloodCenterMapper
                                                        .bloodCenterToNeighborhoodResponseDto(
                                                                firstCenter
                                                        );

                                        List<BloodCenterResponseDto> bloodCenterDtos =
                                                centers.stream()
                                                        .map(bloodCenter -> {

                                                            BloodCenterResponseDto responseDto =
                                                                    bloodCenterMapper
                                                                            .bloodCenterToBloodCenterResponseDto(
                                                                                    bloodCenter
                                                                            );

                                                            responseDto.setFacadeImageUrl(
                                                                    BUCKET_S3_URL_IMAGE + "bloodcenter.svg"
                                                            );

                                                            String status =
                                                                    BloodCenterOpeningValidator
                                                                            .validate(
                                                                                    bloodCenter.getOperation()
                                                                            );

                                                            responseDto.setOperation(status);

                                                            return responseDto;
                                                        })
                                                        .toList();
                                        dto.setNeighborhoodImageUrl("https://blood-centers-images.s3.us-east-1.amazonaws.com/"
                                                + "neighborhood.svg");
                                        dto.setBloodCenters(bloodCenterDtos);

                                        return dto;
                                    })
                                    .toList();

                    zoneDto.setBairros(neighborhoods);

                    return zoneDto;
                })
                .toList();
    }

}