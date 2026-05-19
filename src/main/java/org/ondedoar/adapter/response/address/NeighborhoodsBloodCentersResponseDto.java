package org.ondedoar.adapter.response.address;

import lombok.Getter;
import lombok.Setter;
import org.ondedoar.adapter.response.bloodcenter.BloodCenterResponseDto;

import java.util.List;


@Getter
@Setter
public class NeighborhoodsBloodCentersResponseDto {

    private String bairro;
    private String neighborhoodImageUrl;
    private List<BloodCenterResponseDto> bloodCenters;
}
