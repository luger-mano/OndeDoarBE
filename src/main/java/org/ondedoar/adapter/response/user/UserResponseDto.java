package org.ondedoar.adapter.response.user;

import lombok.Getter;
import lombok.Setter;
import org.ondedoar.domain.enums.BloodType;

@Getter
@Setter
public class UserResponseDto {

    private String userName;
    private String middleName;
    private String mail;
    private BloodType bloodType;
}
