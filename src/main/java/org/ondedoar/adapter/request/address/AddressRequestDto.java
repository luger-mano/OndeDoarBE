package org.ondedoar.adapter.request.address;

import lombok.Getter;
import lombok.Setter;
import org.ondedoar.domain.enums.Zone;

@Getter
@Setter
public class AddressRequestDto {

    private String fullAddress;
    private String cep;
    private String bairro;
    private String estado;
    private String area;
    private String latitude;
    private String longitude;
    private Zone zone;
    private String municipio;
}
