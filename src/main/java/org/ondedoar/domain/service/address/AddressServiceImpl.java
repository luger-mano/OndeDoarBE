package org.ondedoar.domain.service.address;

import jakarta.transaction.Transactional;
import org.ondedoar.adapter.request.address.AddressRequestDto;
import org.ondedoar.domain.model.Address;
import org.ondedoar.domain.repository.AddressRepository;
import org.ondedoar.utils.mapper.AddressMapper;
import org.springframework.stereotype.Service;


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
    public Address createAddress(AddressRequestDto requestDto){
        try {
            Address address = addressMapper.addressRequestDtoToAddress(requestDto);

            addressRepository.save(address);

            return address;

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
