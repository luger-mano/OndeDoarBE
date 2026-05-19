package org.ondedoar.infra.api.openstreetmap;

import org.ondedoar.adapter.request.openstreet.GeolocationDestinationRequestDto;
import org.ondedoar.adapter.request.openstreet.GeolocationStartingPointRequestDto;
import org.ondedoar.adapter.response.openstreet.OpenStreetMapRouteResponseDto;

public interface OpenStreetMapService {

    OpenStreetMapRouteResponseDto routeByGeolocation(GeolocationStartingPointRequestDto startingPointRequestDto,
                                                     GeolocationDestinationRequestDto destinationRequestDto);
}
