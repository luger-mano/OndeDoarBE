package org.ondedoar.adapter.response.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserCreatedResponseDto {

    private String fullName;
    private String phone;
    private String mail;
    private Boolean active;

}
