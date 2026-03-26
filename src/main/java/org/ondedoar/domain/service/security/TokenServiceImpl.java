package org.ondedoar.domain.service.security;

import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.request.security.LoginRequestDto;
import org.ondedoar.adapter.response.security.LoginResponseDto;
import org.ondedoar.domain.model.User;
import org.ondedoar.domain.repository.UserRepository;
import org.ondedoar.infra.exceptions.UserNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.jwt.JwtClaimsSet;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.JwtEncoderParameters;
import org.springframework.stereotype.Service;

import javax.security.auth.login.CredentialException;
import java.time.Instant;

@Service
@Slf4j
public class TokenServiceImpl implements TokenService {

    private final JwtEncoder jwtEncoder;
    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public TokenServiceImpl(JwtEncoder jwtEncoder, UserRepository userRepository, BCryptPasswordEncoder passwordEncoder) {
        this.jwtEncoder = jwtEncoder;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    @Transactional
    public LoginResponseDto generatesToken(LoginRequestDto requestDto) throws CredentialException {
        try {
            User user = userRepository.findByMail(requestDto.getMail())
                    .orElseThrow(() -> new UserNotFoundException("No users with the attached resources were found"));

            if (!user.isLoginCorrect(requestDto, passwordEncoder)) {
                throw new CredentialException("Passwords don't match");
            }
            Instant now = Instant.now();
            long expireIn = 500L;

            JwtClaimsSet claims = JwtClaimsSet.builder()
                    .issuer("ondedoarbe")
                    .subject(user.getUserId().toString())
                    .issuedAt(now)
                    .expiresAt(now.plusSeconds(expireIn))
                    .build();

            String jwtValue = jwtEncoder.encode(JwtEncoderParameters.from(claims)).getTokenValue();
            log.info("Token encode claim configurations");

            LoginResponseDto response = new LoginResponseDto();
            response.setAccessToken(jwtValue);
            response.setExpireIn(expireIn);
            log.info("Setting values for attributes");

            return response;
        } catch (RuntimeException e) {
            log.error("It was not possible to generate a token");
            throw new RuntimeException(e);
        }
    }
}
