package org.ondedoar.domain.service.address;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.response.address.AddressFilterRegionsResponseDto;
import org.ondedoar.domain.model.BloodCenterAddress;
import org.ondedoar.domain.model.BloodCenterAddressSpecifications;
import org.ondedoar.domain.repository.BloodCenterAddressRepository;
import org.ondedoar.infra.api.openstreetmap.UserGeolocationService;
import org.ondedoar.infra.api.viacep.ViaCepService;
import org.ondedoar.utils.mapper.AddressMapper;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class BloodCenterAddressServiceImpl implements BloodCenterAddressService {

    private final BloodCenterAddressRepository bloodCenterAddressRepository;
    private final AddressMapper addressMapper;
    private final UserGeolocationService userGeolocationService;
    private final ViaCepService viaCepService;

//    @Transactional
//    public BloodCenterAddress createAddress(BloodCenterAddressRequestDto request) {
//        try {
//            BloodCenterAddress bloodCenterAddress = viaCepService.searchByCep(request.getCep());
//            bloodCenterAddress.setZone(request.getZone());
//
//            UserCoordinatesResponseDto userGeolocationResponse = userGeolocationService
//                    .returnCoordinatesByLogradouroAndLocalidadeAndCep(new UserCoordinatesRequestDto(
//                            bloodCenterAddress.getLogradouro(),
//                            bloodCenterAddress.getLocalidade(),
//                            bloodCenterAddress.getCep()));
//
//            bloodCenterAddress.setLatitude(userGeolocationResponse.getLat());
//            bloodCenterAddress.setLongitude(userGeolocationResponse.getLon());
//            bloodCenterAddress.setZone(request.getZone());
//
//            log.info("Address saved");
//            return bloodCenterAddressRepository.save(bloodCenterAddress);
//
//        } catch (Exception e) {
//            log.error("Error saving address to database");
//            throw new RuntimeException(e);
//        }
//    }

    @Override
    @Cacheable(cacheNames = "addressByRegion")
    public List<AddressFilterRegionsResponseDto> filterByRegion(String filter, String value) {
        Specification<BloodCenterAddress> addressSpecification = BloodCenterAddressSpecifications.filterColumn(filter, value);
        List<BloodCenterAddress> bloodCenterAddresses = bloodCenterAddressRepository.findAll(addressSpecification);

        return bloodCenterAddresses.stream()
                .map(addressMapper::addressEntityToAddressFilterRegionsResponseDto)
                .collect(Collectors.toList());
    }
}
