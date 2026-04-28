package org.ondedoar.adapter.response.openstreet;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class OpenStreetMapDoubleValuesDto {

    private List<RouteDoubleValuesResponseDto> routes;

    public OpenStreetMapDoubleValuesDto() {
    }

    public OpenStreetMapDoubleValuesDto(List<RouteDoubleValuesResponseDto> routes) {
        this.routes = routes;
    }
}
