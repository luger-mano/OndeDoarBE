package org.ondedoar.domain.service.security;


import org.ondedoar.adapter.request.security.LoginRequestDto;
import org.ondedoar.adapter.response.security.LoginResponseDto;
import org.ondedoar.domain.model.User;

public interface TokenService {
    LoginResponseDto generatesToken(LoginRequestDto requestDto);

    String generateEmailVerificationToken(User user);

    LoginResponseDto generateTokenForUser(User user);

    String generatePasswordResetToken(User user);

}
