package org.ondedoar.adapter.response.bloodcenter;

import lombok.Getter;
import lombok.Setter;
import org.ondedoar.adapter.response.address.AddressResponseDto;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class NearestBloodCenterResponseDto implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    private UUID bloodCenterId;
    private String name;
    private List<String> phone;
    private AddressResponseDto address;
    private String operation;
    private String facadeImageUrl;
    private Double latitude;
    private Double longitude;
    private Double distanceKm;
    private Integer durationSeconds;

    public NearestBloodCenterResponseDto() {
    }

    public NearestBloodCenterResponseDto(UUID bloodCenterId, String name, List<String> phone, AddressResponseDto address, String operation, String facadeImageUrl, Double latitude, Double longitude, Double distanceKm, Integer durationSeconds) {
        this.bloodCenterId = bloodCenterId;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.operation = operation;
        this.facadeImageUrl = facadeImageUrl;
        this.latitude = latitude;
        this.longitude = longitude;
        this.distanceKm = distanceKm;
        this.durationSeconds = durationSeconds;
    }
}
