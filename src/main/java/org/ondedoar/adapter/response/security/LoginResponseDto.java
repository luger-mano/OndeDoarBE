package org.ondedoar.adapter.response.security;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginResponseDto {

    private String accessToken;

    private Long expireIn;
}
