package org.ondedoar.domain.service.security;

import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.request.security.LoginRequestDto;
import org.ondedoar.adapter.response.security.LoginResponseDto;
import org.ondedoar.domain.model.User;
import org.ondedoar.domain.repository.UserRepository;
import org.ondedoar.infra.exceptions.UserNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.jwt.JwtClaimsSet;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.JwtEncoderParameters;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.time.Instant;

@Slf4j
@Service
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
    public LoginResponseDto generatesToken(LoginRequestDto requestDto) {
        User user = userRepository.findByMail(requestDto.getMail())
                .orElseThrow(() -> new UserNotFoundException("..."));

        if (!Boolean.TRUE.equals(user.getActive())) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Confirme seu e-mail...");
        }

        if (!user.isLoginCorrect(requestDto, passwordEncoder)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Passwords don't match");
        }

        return generateTokenForUser(user);
    }

    public LoginResponseDto generateTokenForUser(User user) {
        Instant now = Instant.now();
        long expireIn = 1800L;

        JwtClaimsSet claims = JwtClaimsSet.builder()
                .issuer("ondedoarbe")
                .subject(user.getUserId().toString())
                .issuedAt(now)
                .expiresAt(now.plusSeconds(expireIn))
                .build();

        String jwtValue = jwtEncoder.encode(JwtEncoderParameters.from(claims)).getTokenValue();

        LoginResponseDto response = new LoginResponseDto();
        response.setUserId(user.getUserId());
        response.setAccessToken(jwtValue);
        response.setExpireIn(expireIn);

        return response;
    }

    @Override
    public String generatePasswordResetToken(User user) {
        Instant now = Instant.now();

        JwtClaimsSet claims = JwtClaimsSet.builder()
                .issuer("ondedoarbe")
                .subject(user.getUserId().toString())
                .claim("type", "PASSWORD_RESET")
                .issuedAt(now)
                .expiresAt(now.plusSeconds(300))
                .build();

        return jwtEncoder.encode(JwtEncoderParameters.from(claims)).getTokenValue();
    }


    @Override
    public String generateEmailVerificationToken(User user) {
        Instant now = Instant.now();

        JwtClaimsSet claims = JwtClaimsSet.builder()
                .issuer("ondedoarbe")
                .subject(user.getUserId().toString())
                .claim("type", "EMAIL_VERIFICATION")
                .issuedAt(now)
                .expiresAt(now.plusSeconds(300))
                .build();

        return jwtEncoder.encode(JwtEncoderParameters.from(claims)).getTokenValue();
    }


}
