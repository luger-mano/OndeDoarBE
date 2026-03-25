package org.ondedoar.domain.service.user;

import jakarta.transaction.Transactional;
import org.ondedoar.adapter.request.user.UserCreatedRequestDto;
import org.ondedoar.adapter.response.user.UserCreatedResponseDto;
import org.ondedoar.domain.model.Address;
import org.ondedoar.domain.model.User;
import org.ondedoar.domain.repository.UserRepository;
import org.ondedoar.domain.service.address.AddressService;
import org.ondedoar.infra.exceptions.UserAlreadyExistsException;
import org.ondedoar.utils.mapper.UserMapper;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;
    private final AddressService addressService;

    public UserServiceImpl(UserRepository userRepository, UserMapper userMapper, AddressService addressService) {
        this.userRepository = userRepository;
        this.userMapper = userMapper;
        this.addressService = addressService;
    }

    @Override
    @Transactional
    public UserCreatedResponseDto createUser(UserCreatedRequestDto requestDto) {
        try {
            boolean userExist = userRepository.existsByMail(requestDto.getMail());

            if (userExist) {
                throw new UserAlreadyExistsException("Mail of user already exists.");
            }
            User user = userMapper.userCreatedRequestToUser(requestDto);

            Address address = addressService.createAddress(requestDto.getAddress(), user.getUserId());
            user.setAddress(address);
            user.setActive(true);

            userRepository.save(user);

            return userMapper.userToUserCreatedResponseDto(user);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
