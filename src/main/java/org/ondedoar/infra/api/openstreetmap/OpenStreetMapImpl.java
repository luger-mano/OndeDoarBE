package org.ondedoar.infra.api.openstreetmap;

import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.adapter.request.user.UserCoordinatesRequestDto;
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

@Slf4j
@Component
@RequiredArgsConstructor
public class OpenStreetMapImpl implements OpenStreetMapService, UserGeolocationService {

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
                            .replaceAll("(\\d{5})(\\d3)", "$1-$2")
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
