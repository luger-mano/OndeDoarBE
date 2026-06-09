package org.ondedoar.domain.service.user;

import jakarta.mail.MessagingException;
import org.ondedoar.adapter.request.user.ResetPasswordRequestDto;
import org.ondedoar.adapter.request.user.UserCreatedRequestDto;
import org.ondedoar.adapter.request.user.UserUpdatedRequestDto;
import org.ondedoar.adapter.response.security.LoginResponseDto;
import org.ondedoar.adapter.response.user.UserResponseDto;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;

import java.util.Map;
import java.util.UUID;

public interface UserService {
    Map<String, String> createUser(String idempotencyKey, UserCreatedRequestDto requestDto) throws MessagingException;

    Map<String, String> updateUser(UUID id, UserUpdatedRequestDto requestDto, JwtAuthenticationToken token);

    UserResponseDto getUserById(UUID id);

    Map<String, String> deleteUserById(UUID id, JwtAuthenticationToken token);

    LoginResponseDto verifyEmail(String token);

    void sendPasswordResetMail(String mail) throws MessagingException;

    Map<String, String> resetPasswordByToken(String token, ResetPasswordRequestDto requestDto);
}
