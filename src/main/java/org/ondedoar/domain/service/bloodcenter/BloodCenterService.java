package org.ondedoar.domain.service.bloodcenter;

import org.ondedoar.adapter.response.bloodcenter.BloodCenterResponseDto;
import org.ondedoar.adapter.response.address.NeighborhoodsZoneResponseDto;

import java.util.List;

public interface BloodCenterService {

    List<BloodCenterResponseDto> getAllBloodCenters();

    List<BloodCenterResponseDto> getBloodCentersByAddressContainingIgnoreCase(String search);

    List<NeighborhoodsZoneResponseDto> getBloodCentersGroupedByZone();
}
