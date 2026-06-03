package org.ondedoar.domain.service.user;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.request.user.UserCreatedRequestDto;
import org.ondedoar.adapter.request.user.UserUpdatedRequestDto;
import org.ondedoar.adapter.response.user.UserResponseDto;
import org.ondedoar.domain.enums.BloodType;
import org.ondedoar.domain.enums.BrazilianState;
import org.ondedoar.domain.model.IdempotencyKey;
import org.ondedoar.domain.model.User;
import org.ondedoar.domain.repository.IdempotencyKeyRepository;
import org.ondedoar.domain.repository.UserRepository;
import org.ondedoar.domain.service.idempotency.IdempotencyKeyService;
import org.ondedoar.infra.exceptions.UserNotFoundException;
import org.ondedoar.utils.mapper.UserMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;
    private final BCryptPasswordEncoder passwordEncoder;
    private final IdempotencyKeyRepository idempotencyKeyRepository;
    private final IdempotencyKeyService idempotencyKeyService;

    @Override
    @Transactional
    public Map<String, String> createUser(String idempotencyKeyHeader, UserCreatedRequestDto requestDto) {
        try {
            String statusIdempotency;

            Optional<IdempotencyKey> idempotencyOpp =
                    idempotencyKeyRepository.findByIdempotencyKey(idempotencyKeyHeader);


            boolean userMailExist = userRepository.existsByMail(requestDto.getMail());

            boolean userPhoneExist = userRepository.existsByPhone(requestDto.getPhone());

            if (userMailExist) {
                throw new ResponseStatusException(HttpStatus.CONFLICT, "Mail of user already exists.");
            }

            if (userPhoneExist) {
                throw new ResponseStatusException(HttpStatus.CONFLICT, "Phone of user already exists.");
            }

            if (idempotencyOpp.isPresent()) {
                statusIdempotency = "isPresent";
                return mapResponseReceivedConsent(idempotencyOpp.get().getUserId(), statusIdempotency);
            }

            User user = userMapper.userCreatedRequestToUser(requestDto);

            user.setPassword(passwordEncoder.encode(requestDto.getPassword()));
            user.setActive(true);

            User userSaved = userRepository.save(user);
            log.info("User saved");

            idempotencyKeyService.createIdempotencyKeyByKeyAndUserId(
                    idempotencyKeyHeader,
                    String.valueOf(userSaved.getUserId())
            );
            log.info("idempotencyKey created");
            String statusUser = "created";

            return mapResponseReceivedConsent(
                    String.valueOf(userSaved.getUserId()), statusUser
            );
        } catch (Exception e) {
            log.error("Error saving user to database", e);
            throw e;
        }
    }

    @Override
    @Transactional
    public Map<String, String> updateUser(UUID id, UserUpdatedRequestDto requestDto, JwtAuthenticationToken token) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException("User not found"));

        String status;

        boolean userMailExist = userRepository.existsByMail(requestDto.getMail());
        boolean userPhoneExist = userRepository.existsByPhone(requestDto.getPhone());

        if (userMailExist && !user.getMail().equals(requestDto.getMail())) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Mail of user already exists.");
        }

        if (userPhoneExist && !user.getPhone().equals(requestDto.getPhone())) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Phone of user already exists.");
        }

        if (user.getUserId().equals(UUID.fromString(token.getName()))) {

            if (requestDto.getUserName() != null &&
                    !requestDto.getUserName().isBlank()) {
                user.setUserName(requestDto.getUserName());
            }
            if (requestDto.getMiddleName() != null &&
                    !requestDto.getMiddleName().isBlank()) {
                user.setMiddleName(requestDto.getMiddleName());
            }
            if (requestDto.getMail() != null &&
                    !requestDto.getMail().isBlank()) {
                user.setMail(requestDto.getMail());
            }
            if (requestDto.getPassword() != null &&
                    !requestDto.getPassword().isBlank()) {
                user.setPassword(passwordEncoder.encode(requestDto.getPassword()));
            }

            if (requestDto.getPhone() != null &&
                    !requestDto.getPhone().isBlank()) {
                user.setPhone(requestDto.getPhone());
            }
            if (requestDto.getBloodType() != null &&
                    !requestDto.getBloodType().isBlank()) {
                user.setBloodType(Enum.valueOf(BloodType.class, requestDto.getBloodType()));
            }

            if (requestDto.getState() != null &&
                    !requestDto.getState().isBlank()) {
                user.setState(Enum.valueOf(BrazilianState.class, requestDto.getState()));
            }

            User userUpdated = userRepository.save(user);

            log.info("User updated");

            status = "updated";

            return mapResponseReceivedConsent(
                    String.valueOf(userUpdated.getUserId()),
                    status
            );

        } else {
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN,
                    "You cannot update another user"
            );
        }

    }

    @Override
    public UserResponseDto getUserById(UUID id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException("User not found"));

        return userMapper.userToUserResponseDto(user);
    }

    @Override
    @Transactional
    public Map<String, String> deleteUserById(UUID id, JwtAuthenticationToken token) {

        var user = userRepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException("User not found"));
        String status;


        if (user.getUserId().equals(UUID.fromString(token.getName()))) {
            userRepository.deleteById(id);

            status = "deleted";

            return mapResponseReceivedConsent(
                    String.valueOf(id.toString()
                    ), status);
        } else {
            status = "forbidden";

            return mapResponseReceivedConsent(
                    String.valueOf(id.toString()
                    ), status);
        }

    }

    public Map<String, String> mapResponseReceivedConsent(String userId, String status) {
        return Map.of(
                "userId", userId,
                "message", "user request received",
                "status", status
        );
    }
}
