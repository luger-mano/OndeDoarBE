package org.ondedoar.domain.service.bloodcenter;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.response.bloodcenter.BloodCenterResponseDto;
import org.ondedoar.domain.model.bloodcenter.BloodCenter;
import org.ondedoar.domain.model.bloodcenter.BloodCenterSpecifications;
import org.ondedoar.domain.repository.BloodCenterRepository;
import org.ondedoar.utils.mapper.BloodCenterMapper;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
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

                    verifyBloodCenterRegionImages(bloodCenter, dto);

                    String status = BloodCenterOpeningValidator.validate(bloodCenter.getOperation());
                    dto.setOperation(status);

                    return dto;
                })
                .collect(Collectors.toList());
    }

    private static void verifyBloodCenterRegionImages(BloodCenter bloodCenter, BloodCenterResponseDto dto) {
        if (bloodCenter.getBloodCenterAddress().getMunicipio() == null) {
            dto.setNeighborhoodImageUrl("https://blood-centers-images.s3.us-east-1.amazonaws.com/" + "neighborhood.svg");
        } else {
            dto.setMunicipalityImageUrl("https://blood-centers-images.s3.us-east-1.amazonaws.com/" + "municipality.svg");
        }
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

                    verifyBloodCenterRegionImages(bloodCenter, dto);

                    String status = BloodCenterOpeningValidator.validate(bloodCenter.getOperation());
                    dto.setOperation(status);

                    return dto;}).collect(Collectors.toList());
    }

}