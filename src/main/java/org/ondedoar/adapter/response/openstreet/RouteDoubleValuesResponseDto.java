package org.ondedoar.adapter.response.openstreet;


import lombok.Getter;

@Getter
public class RouteDoubleValuesResponseDto {

    private Double distance;
    private Double duration;

    public RouteDoubleValuesResponseDto() {
    }
}
