package org.ondedoar.domain.service.address;

import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.domain.model.Address;
import org.ondedoar.domain.repository.AddressRepository;
import org.ondedoar.utils.mapper.AddressMapper;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;


@Slf4j
@Service
public class AddressServiceImpl implements AddressService {

    private final AddressRepository addressRepository;
    private final AddressMapper addressMapper;

    public AddressServiceImpl(AddressRepository addressRepository, AddressMapper addressMapper) {
        this.addressRepository = addressRepository;
        this.addressMapper = addressMapper;
    }

    @Override
    @Transactional
    public void createAddress(Address request) {
        try {

            if (request == null) {
                throw new ResponseStatusException(HttpStatus.NOT_FOUND,
                        "No Address found - [Path] : UserServiceImpl -> AddressServiceImpl");
            }

            log.info("Address saved");
            Address addressSaved = addressRepository.save(request);
            addressMapper.addressToAddressResponseDto(addressSaved);
        } catch (Exception e) {
            log.error("Error saving address to database");
            throw new RuntimeException(e);
        }
    }
}
