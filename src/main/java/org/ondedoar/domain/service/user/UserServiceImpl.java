package org.ondedoar.domain.service.user;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.request.user.UserCreatedRequestDto;
import org.ondedoar.adapter.response.user.UserCreatedResponseDto;
import org.ondedoar.domain.model.Address;
import org.ondedoar.domain.model.User;
import org.ondedoar.domain.repository.UserRepository;
import org.ondedoar.domain.service.address.AddressService;
import org.ondedoar.infra.exceptions.UserAlreadyExistsException;
import org.ondedoar.utils.mapper.UserMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;
    private final AddressService addressService;
    private final BCryptPasswordEncoder passwordEncoder;

    @Override
    @Transactional
    public UserCreatedResponseDto createUser(UserCreatedRequestDto requestDto) {
        try {
            boolean userExist = userRepository.existsByMail(requestDto.getMail());

            if (userExist) {
                throw new UserAlreadyExistsException("Mail of user already exists.");
            }

            User user = userMapper.userCreatedRequestToUser(requestDto);

            Address address = addressService.createAddress(requestDto.getAddress());
            log.info("Saving the address in database");

            user.setAddress(address);
            user.setPassword(passwordEncoder.encode(requestDto.getPassword()));
            user.setActive(true);

            userRepository.save(user);
            log.info("User saved into User entity");

            return userMapper.userToUserCreatedResponseDto(user);
        } catch (Exception e) {
            log.error("Error saving user to database");
            throw new RuntimeException(e);
        }
    }
}
