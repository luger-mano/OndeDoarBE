package org.ondedoar.adapter.request.address;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import org.ondedoar.domain.enums.Zone;

@Getter
@Setter
public class AddressRequestDto {

    @NotBlank(message = "Campo 'fullAddress' deve ser preenchido")
    private String fullAddress;
    private String cep;
    private String bairro;
    @NotBlank(message = "Campo 'estado' deve ser preenchido")
    private String estado;
    @NotBlank(message = "Campo 'area' deve ser preenchido")
    private String area;
    @NotBlank(message = "Campo 'latitude' deve ser preenchido")
    private String latitude;
    @NotBlank(message = "Campo 'longitude' deve ser preenchido")
    private String longitude;
    @NotBlank(message = "Campo 'zone' deve ser preenchido")
    private Zone zone;
    private String municipio;
}
