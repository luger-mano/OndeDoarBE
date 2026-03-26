package org.ondedoar.adapter.request.user;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import org.ondedoar.adapter.request.address.AddressRequestDto;
import org.ondedoar.domain.model.Address;

import java.time.LocalDate;

@Getter
@Setter
public class UserCreatedRequestDto {

    @NotBlank(message = "Campo 'fullName' deve ser preenchido")
    private String fullName;

    @NotBlank(message = "Campo 'phone' deve ser preenchido")
    private String phone;

    @Email
    @NotBlank(message = "Campo 'mail' deve ser preenchido")
    private String mail;

    @NotBlank(message = "Campo 'password' deve ser preenchido")
    private String password;

    private AddressRequestDto address;

    private LocalDate dateBirth;

    @NotBlank(message = "Campo 'bloodType' deve ser preenchido")
    private String bloodType;

    private LocalDate lastDonation;

}
