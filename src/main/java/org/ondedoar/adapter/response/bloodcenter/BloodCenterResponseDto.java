package org.ondedoar.adapter.response.bloodcenter;

import lombok.Getter;
import lombok.Setter;
import org.ondedoar.adapter.response.address.AddressResponseDto;
import org.ondedoar.adapter.response.openstreet.RouteResponseDto;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class BloodCenterResponseDto {

    private UUID bloodCenterId;
    private String name;
    private List<String> phone;
    private AddressResponseDto address;
    private String operation;
    private String facadeImageUrl;
    private List<RouteResponseDto> routes;

}
