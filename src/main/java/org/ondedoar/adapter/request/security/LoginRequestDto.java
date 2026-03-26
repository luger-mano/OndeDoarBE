package org.ondedoar.adapter.request.security;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginRequestDto {

    @Email
    @NotBlank(message = "Campo 'mail' deve ser preenchido")
    private String mail;

    @NotBlank(message = "Campo 'password' deve ser preenchido")
    private String password;

}
