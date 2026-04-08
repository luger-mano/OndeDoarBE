package org.ondedoar.infra.api.openstreetmap;

import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.request.openstreet.GeolocationDestinationRequestDto;
import org.ondedoar.adapter.request.openstreet.GeolocationStartingPointRequestDto;
import org.ondedoar.adapter.response.openstreet.OpenStreetMapRouteResponseDto;
import org.ondedoar.adapter.response.openstreet.RouteResponseDto;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Component
public class OpenStreetMapImpl implements OpenStreetMapService {

    @Override
    public OpenStreetMapRouteResponseDto routeByGeolocation(GeolocationStartingPointRequestDto startingPointRequestDto, GeolocationDestinationRequestDto destinationRequestDto) {
        try {
            Gson gson = new Gson();

            HttpClient client = HttpClient.newHttpClient();

            String url = String.format(
                    "https://router.project-osrm.org/route/v1/driving/%s,%s;%s,%s?overview=false",
                    startingPointRequestDto.getLongitudeStarting(),
                    startingPointRequestDto.getLatitudeStarting(),
                    destinationRequestDto.getLongitudeDestination(),
                    destinationRequestDto.getLatitudeDestination()
            );

            log.info("Url gerada: {}", url);

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .GET()
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            String responseBody = response.body();

            if (!responseBody.isBlank()) {
                log.info("[OpenStreetMapImpl | drivingRouteByGeolocation] - Object Java serializado: {}", responseBody);
                var map = gson.fromJson(responseBody, OpenStreetMapRouteResponseDto.class);

                List<RouteResponseDto> routes = new ArrayList<>();

                Double distance = map.getRoutes().get(0).getDistance() / 1000;
                Double duration = map.getRoutes().get(0).getDuration() / 60;

                RouteResponseDto routeResponseDto = new RouteResponseDto();
                routeResponseDto.setDistance(distance);
                routeResponseDto.setDuration(duration);

                routes.add(routeResponseDto);

                map.setRoutes(routes);

                return map;
            }

            throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        } catch (RuntimeException | InterruptedException | IOException e) {
            log.error("Erro ao serializar o object Java para Json | drivingRouteByGeolocation: {}", e.getMessage());
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
        }
    }
}
