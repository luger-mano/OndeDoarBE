package org.ondedoar.domain.service.address;

import org.ondedoar.adapter.request.address.AddressRequestDto;
import org.ondedoar.adapter.response.address.AddressResponseDto;
import org.ondedoar.domain.model.Address;

import java.util.UUID;

public interface AddressService {

    Address createAddress(AddressRequestDto requestDto, UUID userId);
}
