package org.ondedoar.adapter.request.address;

import lombok.Getter;
import lombok.Setter;
import org.ondedoar.domain.enums.Zone;

import java.util.UUID;

@Getter
@Setter
public class AddressRequestDto {

    private String fullAddress;
    private String cep;
    private String bairro;
    private String estado;
    private String regiao;
    private String area;
    private String latitude;
    private String longitude;
    private Zone zone;
    private String municipio;
    private UUID userId;
}
