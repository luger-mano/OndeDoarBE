package org.ondedoar.adapter.response.bloodcenter;

import lombok.Getter;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;
import java.util.UUID;

@Getter
@Setter
public class NearestBloodCenterResponseDto implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    private UUID bloodCenterId;
    private String name;
    private Double latitude;
    private Double longitude;
    private Double distanceKm;
    private Integer durationSeconds;

    public NearestBloodCenterResponseDto() {
    }

    public NearestBloodCenterResponseDto(UUID bloodCenterId, String name, Double latitude, Double longitude, Double distanceKm, Integer durationSeconds) {
        this.bloodCenterId = bloodCenterId;
        this.name = name;
        this.latitude = latitude;
        this.longitude = longitude;
        this.distanceKm = distanceKm;
        this.durationSeconds = durationSeconds;
    }
}
