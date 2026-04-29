package org.ondedoar.domain.service.address;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.request.address.AddressRequestDto;
import org.ondedoar.adapter.request.user.UserCoordinatesRequestDto;
import org.ondedoar.adapter.response.address.AddressFilterRegionsResponseDto;
import org.ondedoar.adapter.response.user.UserCoordinatesResponseDto;
import org.ondedoar.domain.model.Address;
import org.ondedoar.domain.model.AddressSpecifications;
import org.ondedoar.domain.repository.AddressRepository;
import org.ondedoar.infra.api.openstreetmap.UserGeolocationService;
import org.ondedoar.infra.api.viacep.ViaCepService;
import org.ondedoar.utils.mapper.AddressMapper;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class AddressServiceImpl implements AddressService {

    private final AddressRepository addressRepository;
    private final AddressMapper addressMapper;
    private final UserGeolocationService userGeolocationService;
    private final ViaCepService viaCepService;

    @Override
    @Transactional
    public Address createAddress(AddressRequestDto request) {
        try {
            Address address = viaCepService.searchByCep(request.getCep());
            address.setZone(request.getZone());

            UserCoordinatesResponseDto userGeolocationResponse = userGeolocationService
                    .returnCoordinatesByLogradouroAndLocalidadeAndCep(new UserCoordinatesRequestDto(
                            address.getLogradouro(),
                            address.getLocalidade(),
                            address.getCep()));

            address.setLatitude(userGeolocationResponse.getLat());
            address.setLongitude(userGeolocationResponse.getLon());
            address.setZone(request.getZone());

            log.info("Address saved");
            return addressRepository.save(address);

        } catch (Exception e) {
            log.error("Error saving address to database");
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<AddressFilterRegionsResponseDto> filterByRegion(String filter, String value) {
        Specification<Address> addressSpecification = AddressSpecifications.filterColumn(filter, value);
        List<Address> addresses = addressRepository.findAll(addressSpecification);

        return addresses.stream()
                .map(addressMapper::addressEntityToAddressFilterRegionsResponseDto)
                .collect(Collectors.toList());
    }


}
