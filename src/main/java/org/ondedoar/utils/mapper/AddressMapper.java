package org.ondedoar.utils.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.ondedoar.adapter.response.address.AddressFilterRegionsResponseDto;
import org.ondedoar.domain.model.Address;

@Mapper(componentModel = "spring")
public interface AddressMapper {

    @Mapping(target = "bairro", source = "bairro", defaultValue = "s/b")
    @Mapping(target = "municipio", source = "municipio", defaultValue = "s/m")
    AddressFilterRegionsResponseDto addressEntityToAddressFilterRegionsResponseDto(Address address);
}
