package org.ondedoar.domain.service.address;

import org.ondedoar.adapter.request.address.AddressRequestDto;
import org.ondedoar.domain.model.Address;

public interface AddressService {

    Address createAddress(AddressRequestDto request);
}
