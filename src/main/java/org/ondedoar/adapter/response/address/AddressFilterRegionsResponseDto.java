package org.ondedoar.adapter.response.address;

import lombok.Getter;
import lombok.Setter;
import org.ondedoar.domain.enums.Zone;

@Getter
@Setter
public class AddressFilterRegionsResponseDto {

    private String fullAddress;
    private String bairro;
    private String latitude;
    private String longitude;
    private Zone zone;
    private String municipio;
}
