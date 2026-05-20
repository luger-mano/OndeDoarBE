package org.ondedoar.utils.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.ondedoar.adapter.response.address.NeighborhoodsBloodCentersResponseDto;
import org.ondedoar.adapter.response.bloodcenter.BloodCenterResponseDto;
import org.ondedoar.domain.model.bloodcenter.BloodCenter;

@Mapper(componentModel = "spring")
public interface BloodCenterMapper {

    @Mapping(target = "address.bairro", source = "bloodCenterAddress.bairro", defaultValue = "s/b")
    @Mapping(target = "address.municipio", source = "bloodCenterAddress.municipio", defaultValue = "s/m")
    BloodCenterResponseDto bloodCenterToBloodCenterResponseDto(BloodCenter bloodCenter);

    @Mapping(target = "bairro", source = "bloodCenterAddress.bairro")
    @Mapping(target = "bloodCenters", ignore = true)
    NeighborhoodsBloodCentersResponseDto
    bloodCenterToNeighborhoodResponseDto(BloodCenter bloodCenter);
}
