package org.ondedoar.infra.api.openstreetmap;

import org.ondedoar.adapter.request.openstreet.GeolocationDestinationRequestDto;
import org.ondedoar.adapter.response.openstreet.OpenStreetMapRouteResponseDto;

import java.util.UUID;

public interface OpenStreetMapService {

    OpenStreetMapRouteResponseDto routeByGeolocation(UUID userId,
                                                     GeolocationDestinationRequestDto destinationRequestDto);
}
