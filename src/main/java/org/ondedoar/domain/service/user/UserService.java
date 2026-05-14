package org.ondedoar.domain.service.user;

import org.ondedoar.adapter.request.user.UserCreatedRequestDto;

import java.util.Map;

public interface UserService {
    Map<String, String> createUser(String idempotencyKey, UserCreatedRequestDto requestDto);
}
