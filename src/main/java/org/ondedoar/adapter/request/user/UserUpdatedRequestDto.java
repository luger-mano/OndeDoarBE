package org.ondedoar.adapter.request.user;

import jakarta.validation.constraints.Email;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserUpdatedRequestDto {

    private String userName;

    private String middleName;

    private String phone;

    @Email
    private String mail;

    private String password;

    private String bloodType;

    private String state;
}
