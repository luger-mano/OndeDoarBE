package org.ondedoar.adapter.controller;

import lombok.RequiredArgsConstructor;
import org.ondedoar.adapter.request.openstreet.GeolocationDestinationRequestDto;
import org.ondedoar.adapter.response.openstreet.OpenStreetMapRouteResponseDto;
import org.ondedoar.infra.api.openstreetmap.OpenStreetMapService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/route")
public class OpenStreetMapController {

    private final OpenStreetMapService openStreetMapService;

    @GetMapping
    public ResponseEntity<OpenStreetMapRouteResponseDto> searchRouteByGeolocation(
            @RequestParam UUID userId,
            @ModelAttribute GeolocationDestinationRequestDto destinationRequestDto){

        var response = openStreetMapService.routeByGeolocation(userId, destinationRequestDto);
        return ResponseEntity.ok(response);
    }
}
