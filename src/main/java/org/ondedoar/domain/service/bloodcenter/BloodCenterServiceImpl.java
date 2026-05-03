package org.ondedoar.domain.service.bloodcenter;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.response.bloodcenter.BloodCenterBySearchResponseDto;
import org.ondedoar.adapter.response.bloodcenter.BloodCenterResponseDto;
import org.ondedoar.domain.model.BloodCenter;
import org.ondedoar.domain.model.BloodCenterSpecifications;
import org.ondedoar.domain.repository.BloodCenterRepository;
import org.ondedoar.utils.mapper.BloodCenterMapper;
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

    @Override
    public List<BloodCenterResponseDto> getAllBloodCenters() {
        return bloodCenterRepository
                .findAll()
                .stream()
                .map(bloodCenterMapper::bloodCenterToBloodCenterResponseDto)
                .collect(Collectors.toList());
    }

    @Override
    public List<BloodCenterBySearchResponseDto> getBloodCentersByAddressContainingIgnoreCase(String search) {
        Specification<BloodCenter> bloodCenterSpecification = BloodCenterSpecifications.searchByTerm(search);
        List<BloodCenter> centers = bloodCenterRepository.findAll(bloodCenterSpecification);

        return centers.stream()
                .map(bloodCenterMapper::bloodCenterEntityToBloodCenterBySearchResponseDto)
                .collect(Collectors.toList());
    }


}
