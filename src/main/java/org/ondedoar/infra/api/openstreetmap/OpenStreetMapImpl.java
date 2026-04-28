package org.ondedoar.infra.api.openstreetmap;

import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jspecify.annotations.NonNull;
import org.ondedoar.adapter.request.openstreet.GeolocationDestinationRequestDto;
import org.ondedoar.adapter.request.openstreet.GeolocationStartingPointRequestDto;
import org.ondedoar.adapter.request.user.UserCoordinatesRequestDto;
import org.ondedoar.adapter.response.openstreet.OpenStreetMapDoubleValuesDto;
import org.ondedoar.adapter.response.openstreet.OpenStreetMapRouteResponseDto;
import org.ondedoar.adapter.response.openstreet.RouteResponseDto;
import org.ondedoar.adapter.response.user.UserCoordinatesResponseDto;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class OpenStreetMapImpl implements OpenStreetMapService, UserGeolocationService{

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
                var map = gson.fromJson(responseBody, OpenStreetMapDoubleValuesDto.class);

                System.out.println(map.getRoutes().get(0).getDistance());
                System.out.println(map.getRoutes().get(0).getDuration());

                return setDistanceAndDuration(map);
            }

            throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        } catch (RuntimeException | InterruptedException | IOException e) {
            log.error("Erro ao serializar o object Java para Json | drivingRouteByGeolocation: {}", e.getMessage());
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
        }
    }

    private static @NonNull OpenStreetMapRouteResponseDto setDistanceAndDuration(OpenStreetMapDoubleValuesDto map) {

        double distanceMap = map.getRoutes().get(0).getDistance() / 1000;
        double durationMap = map.getRoutes().get(0).getDuration() / 60;

        List<RouteResponseDto> routes = new ArrayList<>();

        int distance = (int) Math.ceil(distanceMap - 0.5);
        int duration = (int) Math.ceil(durationMap - 0.5);

        RouteResponseDto routeResponseDto = new RouteResponseDto();
        routeResponseDto.setDistance(distance);
        routeResponseDto.setDuration(duration);

        routes.add(routeResponseDto);

        OpenStreetMapRouteResponseDto mapRouteResponseDto = new OpenStreetMapRouteResponseDto();
        mapRouteResponseDto.setRoutes(routes);
        return mapRouteResponseDto;
    }

    @Override
    public UserCoordinatesResponseDto returnCoordinatesByLogradouroAndLocalidadeAndCep(UserCoordinatesRequestDto requestDto) {
        try {
            Gson gson = new Gson();

            HttpClient client = HttpClient.newHttpClient();

            String query = String.format(
                    "%s %s %s",
                    requestDto.getLogradouro(),
                    requestDto.getLocalidade(),
                    requestDto.getCep()
                            .replaceAll("\\D", "")
                            .replaceAll("(\\d{5})(\\d3)","$1-$2")
            );

            String url = "https://nominatim.openstreetmap.org/search?q=" +
                    URLEncoder.encode(query, StandardCharsets.UTF_8) +
                    "&format=json&addressdetails=1&limit=1&polygon_svg=1";

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .GET()
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            String responseBody = response.body();

            if (!responseBody.isBlank()) {
                log.info("[OpenStreetMapImpl | returnGeolocationByLogradouroAndLocalidadeAndBairro] -" +
                        " Object Java serializado: {}", responseBody);

                UserCoordinatesResponseDto[] responseArray =
                        gson.fromJson(responseBody, UserCoordinatesResponseDto[].class);

                if (responseArray.length > 0) {
                    return responseArray[0];
                }
            }

            throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        } catch (RuntimeException | InterruptedException | IOException e) {
            log.error("Erro ao serializar o object Java para Json | returnGeolocationByLogradouroAndLocalidadeAndBairro: {}", e.getMessage());
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
        }
    }
}
