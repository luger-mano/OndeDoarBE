package org.ondedoar.domain.service.address;

import org.ondedoar.adapter.response.address.AddressFilterRegionsResponseDto;

import java.util.List;

public interface BloodCenterAddressService {

    List<AddressFilterRegionsResponseDto> filterByRegion(String filter, String value);
}
