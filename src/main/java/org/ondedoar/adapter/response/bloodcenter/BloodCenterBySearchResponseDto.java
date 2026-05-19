package org.ondedoar.adapter.response.bloodcenter;

import lombok.Getter;
import lombok.Setter;
import org.ondedoar.adapter.response.address.AddressResponseDto;
import org.ondedoar.domain.enums.BloodCenterStatus;

import java.util.List;

@Getter
@Setter

public class BloodCenterBySearchResponseDto {

    private String name;
    private List<String> phone;
    private AddressResponseDto address;
    private BloodCenterStatus operation;
    private Double bloodStock;

}