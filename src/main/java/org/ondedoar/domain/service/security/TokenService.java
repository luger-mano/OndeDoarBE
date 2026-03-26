package org.ondedoar.domain.service.security;


import org.ondedoar.adapter.request.security.LoginRequestDto;
import org.ondedoar.adapter.response.security.LoginResponseDto;

import javax.security.auth.login.CredentialException;

public interface TokenService {
    LoginResponseDto generatesToken(LoginRequestDto requestDto) throws CredentialException;
}
