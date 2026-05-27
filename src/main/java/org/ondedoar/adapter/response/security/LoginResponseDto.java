package org.ondedoar.adapter.response.security;

import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
public class LoginResponseDto {

    private String accessToken;

    private Long expireIn;

    private UUID userId;

}
