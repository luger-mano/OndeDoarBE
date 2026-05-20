package org.ondedoar.adapter.request.user;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserUpdatedRequestDto {

    @NotBlank(message = "Campo 'userName' deve ser preenchido")
    private String userName;

    @NotBlank(message = "Campo 'middleName' deve ser preenchido")
    private String middleName;

    @NotBlank(message = "Campo 'phone' deve ser preenchido")
    private String phone;

    @Email
    @NotBlank(message = "Campo 'mail' deve ser preenchido")
    private String mail;

    @NotBlank(message = "Campo 'password' deve ser preenchido")
    private String password;

    @NotBlank(message = "Campo 'bloodType' deve ser preenchido")
    private String bloodType;

    @NotBlank(message = "Campo 'state' deve ser preenchido")
    private String state;
}
