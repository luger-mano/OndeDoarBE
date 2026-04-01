package org.ondedoar.utils.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.ondedoar.adapter.response.bloodcenter.BloodCenterResponseDto;
import org.ondedoar.domain.model.BloodCenter;

@Mapper(componentModel = "spring")
public interface BloodCenterMapper {

    @Mapping(target = "address.bairro", source = "address.bairro", defaultValue = "s/b")
    @Mapping(target = "address.municipio", source = "address.municipio", defaultValue = "s/m")
    BloodCenterResponseDto bloodCenterToBloodCenterResponseDto(BloodCenter bloodCenter);
}
