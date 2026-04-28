package org.ondedoar.adapter.response.openstreet;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RouteResponseDto {
    private Integer duration;
    private Integer distance;

    public RouteResponseDto() {
    }
}
