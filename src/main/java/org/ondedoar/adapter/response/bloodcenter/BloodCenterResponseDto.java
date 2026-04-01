package org.ondedoar.adapter.response.bloodcenter;

import lombok.Getter;
import lombok.Setter;
import org.ondedoar.adapter.response.address.AddressResponseDto;
import org.ondedoar.domain.model.Address;

import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class BloodCenterResponseDto {

    private UUID bloodCenterId;
    private String name;
    private List<String> phone;
    private AddressResponseDto address;
    private LocalTime operation;
    private Double bloodStock;

}
