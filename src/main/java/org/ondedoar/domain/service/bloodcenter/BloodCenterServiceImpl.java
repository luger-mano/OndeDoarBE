package org.ondedoar.domain.service.bloodcenter;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.response.bloodcenter.BloodCenterResponseDto;
import org.ondedoar.domain.repository.BloodCenterRepository;
import org.ondedoar.utils.mapper.BloodCenterMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class BloodCenterServiceImpl implements BloodCenterService{

    private final BloodCenterMapper bloodCenterMapper;
    private final BloodCenterRepository bloodCenterRepository;

    @Override
    public List<BloodCenterResponseDto> getAllBloodCenters() {
        return bloodCenterRepository
                .findAll()
                .stream()
                .map(bloodCenterMapper::bloodCenterToBloodCenterResponseDto)
                .toList();
    }
}
