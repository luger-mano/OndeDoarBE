package org.ondedoar.utils.mapper;

import org.mapstruct.Mapper;
import org.ondedoar.adapter.request.address.AddressRequestDto;
import org.ondedoar.adapter.request.user.UserCreatedRequestDto;
import org.ondedoar.adapter.response.address.AddressResponseDto;
import org.ondedoar.adapter.response.user.UserCreatedResponseDto;
import org.ondedoar.domain.model.Address;
import org.ondedoar.domain.model.User;

@Mapper(componentModel = "spring")
public interface AddressMapper {

    Address addressRequestDtoToAddress(AddressRequestDto addressRequestDto);
    AddressResponseDto addressToAddressResponseDto(Address address);

}
