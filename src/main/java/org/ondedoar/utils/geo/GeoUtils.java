package org.ondedoar.utils.geo;

import lombok.extern.slf4j.Slf4j;
import org.jspecify.annotations.NonNull;
import org.ondedoar.adapter.response.openstreet.OpenStreetMapDoubleValuesDto;
import org.ondedoar.adapter.response.openstreet.RouteResponseDto;

import java.util.ArrayList;
import java.util.List;


@Slf4j
public class GeoUtils {

    private static final int EARTH_RADIUS_KM = 6371;

    public static double calculateHaversineDistance(double startLat, double startLong, double endLat, double endLon) {
        double latDistance = Math.toRadians(endLat - startLat);
        double longDistance = Math.toRadians(endLon - startLong);

        double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
                + Math.cos(Math.toRadians(startLat)) * Math.cos(Math.toRadians(endLat))
                * Math.sin(longDistance / 2) * Math.sin(longDistance / 2);

        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        return EARTH_RADIUS_KM * c;
    }

    public static @NonNull RouteResponseDto setDistanceAndDuration(OpenStreetMapDoubleValuesDto map) {

        double distanceMap = map.getRoutes().get(0).getDistance() / 1000;
        double durationMap = map.getRoutes().get(0).getDuration() / 60;

        List<RouteResponseDto> routes = new ArrayList<>();

        int distance = (int) Math.ceil(distanceMap - 0.5);
        int duration = (int) Math.ceil(durationMap - 0.5);

        RouteResponseDto routeResponseDto = new RouteResponseDto();
        routeResponseDto.setDistance(distance);
        routeResponseDto.setDuration(duration);

        routes.add(routeResponseDto);

        return routeResponseDto;
    }
}
