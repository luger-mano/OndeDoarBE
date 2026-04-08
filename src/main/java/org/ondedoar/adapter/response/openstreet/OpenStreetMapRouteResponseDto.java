package org.ondedoar.adapter.response.openstreet;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class OpenStreetMapRouteResponseDto {
    private List<RouteResponseDto> routes;

    public OpenStreetMapRouteResponseDto() {
    }

    public OpenStreetMapRouteResponseDto(List<RouteResponseDto> routes) {
        this.routes = routes;
    }
}
