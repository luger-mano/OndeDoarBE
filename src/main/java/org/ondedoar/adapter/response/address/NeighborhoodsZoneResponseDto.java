package org.ondedoar.adapter.response.address;

import lombok.Getter;
import lombok.Setter;
import org.ondedoar.domain.enums.Zone;

import java.util.List;

@Getter
@Setter
public class NeighborhoodsZoneResponseDto {

    private Zone zone;
    private List<NeighborhoodsBloodCentersResponseDto> bairros;
}
