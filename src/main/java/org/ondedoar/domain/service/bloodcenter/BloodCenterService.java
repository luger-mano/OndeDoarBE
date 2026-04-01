package org.ondedoar.domain.service.bloodcenter;

import org.ondedoar.adapter.response.bloodcenter.BloodCenterResponseDto;

import java.util.List;

public interface BloodCenterService {

    List<BloodCenterResponseDto> getAllBloodCenters();
}
