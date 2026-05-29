package org.ondedoar.domain.service.osrm;

import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.response.openstreet.OpenStreetMapDoubleValuesDto;
import org.ondedoar.adapter.response.openstreet.RouteResponseDto;
import org.ondedoar.utils.geo.GeoUtils;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Locale;

@Slf4j
@Service
public class OsrmRoutingServiceImpl implements OsrmRoutingService {

    private final Gson gson = new Gson();
    private final HttpClient client = HttpClient.newHttpClient();

    @Override
    @Cacheable(
            value = "osrmRoute",
            key = "#startLat + '_' + #startLon + '_' + #endLat + '_' + #endLon"
    )
    public RouteResponseDto getRoute(String startLat, String startLon, String endLat, String endLon) {
        try {

            String url = String.format(Locale.US,
                    "https://router.project-osrm.org/route/v1/driving/%s,%s;%s,%s?overview=false",
                    startLon,
                    startLat,
                    endLon,
                    endLat
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
                if (map.getRoutes() != null && !map.getRoutes().isEmpty()) {
                    return GeoUtils.setDistanceAndDuration(map);
                }
            }
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        } catch (RuntimeException | InterruptedException | IOException e) {
            log.error("Erro ao buscar rota no OSRM | getRoute: {}", e.getMessage(), e);
            return new RouteResponseDto();
        }
    }
}
