package org.ondedoar.domain.service.address;

import org.ondedoar.adapter.request.address.AddressRequestDto;
import org.ondedoar.adapter.response.address.AddressFilterRegionsResponseDto;
import org.ondedoar.domain.model.Address;

import java.util.List;

public interface AddressService {

    Address createAddress(AddressRequestDto request);

    List<AddressFilterRegionsResponseDto> filterByRegion(String filter, String value);
}
