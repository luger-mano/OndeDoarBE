package org.ondedoar.domain.service.user;

import org.ondedoar.adapter.request.user.UserCreatedRequestDto;
import org.ondedoar.adapter.response.user.UserCreatedResponseDto;

public interface UserService {
    UserCreatedResponseDto createUser(UserCreatedRequestDto requestDto);
}
