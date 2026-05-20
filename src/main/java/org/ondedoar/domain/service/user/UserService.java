package org.ondedoar.domain.service.user;

import org.ondedoar.adapter.request.user.UserCreatedRequestDto;
import org.ondedoar.adapter.request.user.UserUpdatedRequestDto;
import org.ondedoar.adapter.response.user.UserResponseDto;

import java.util.Map;
import java.util.UUID;

public interface UserService {
    Map<String, String> createUser(String idempotencyKey, UserCreatedRequestDto requestDto);

    Map<String, String> updateUser(UUID id, UserUpdatedRequestDto requestDto);

    UserResponseDto getUserById(UUID id);

    Map<String, String> deleteUserById(UUID id);
}
