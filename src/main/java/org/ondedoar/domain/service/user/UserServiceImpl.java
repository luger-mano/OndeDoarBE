package org.ondedoar.domain.service.user;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.request.user.UserCreatedRequestDto;
import org.ondedoar.domain.model.Address;
import org.ondedoar.domain.model.IdempotencyKey;
import org.ondedoar.domain.model.User;
import org.ondedoar.domain.repository.IdempotencyKeyRepository;
import org.ondedoar.domain.repository.UserRepository;
import org.ondedoar.domain.service.address.AddressService;
import org.ondedoar.domain.service.idempotency.IdempotencyKeyService;
import org.ondedoar.utils.mapper.UserMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.Map;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;
    private final AddressService addressService;
    private final BCryptPasswordEncoder passwordEncoder;
    private final IdempotencyKeyRepository idempotencyKeyRepository;
    private final IdempotencyKeyService idempotencyKeyService;

    @Override
    @Transactional
    public Map<String, String> createUser(String idempotencyKeyHeader, UserCreatedRequestDto requestDto) {
        try {

            Optional<IdempotencyKey> idempotencyOpp =
                    idempotencyKeyRepository.findByIdempotencyKey(idempotencyKeyHeader);


            if (idempotencyOpp.isPresent()) {
                return mapResponseReceivedConsent(idempotencyOpp.get().getUserId());
            }

            boolean userExist = userRepository.existsByMail(requestDto.getMail());

            if (userExist) {
                throw new ResponseStatusException(HttpStatus.CONFLICT, "Mail of user already exists.");
            }

            User user = userMapper.userCreatedRequestToUser(requestDto);

            Address address = addressService.createAddress(requestDto.getAddress());
            log.info("Saving the address in database");

            user.setAddress(address);
            user.setPassword(passwordEncoder.encode(requestDto.getPassword()));
            user.setActive(true);

            User userSaved = userRepository.save(user);
            log.info("User saved into User entity");

            idempotencyKeyService.createIdempotencyKeyByKeyAndUserId(
                    idempotencyKeyHeader,
                    String.valueOf(userSaved.getUserId())
            );

            return mapResponseReceivedConsent(
                    String.valueOf(userSaved.getUserId())
            );
        } catch (Exception e) {
            log.error("Error saving user to database", e);
            throw e;
        }
    }

    public Map<String, String> mapResponseReceivedConsent(String userId) {
        return Map.of(
                "userId", userId,
                "message", "user request received",
                "status", "processed"
        );
    }
}
