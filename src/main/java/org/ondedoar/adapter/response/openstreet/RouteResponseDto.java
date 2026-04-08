package org.ondedoar.adapter.response.openstreet;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RouteResponseDto {
    private Double duration;
    private Double distance;

    public RouteResponseDto() {
    }
}
