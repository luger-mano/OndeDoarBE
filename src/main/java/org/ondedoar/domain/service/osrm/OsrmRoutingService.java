package org.ondedoar.domain.service.osrm;

import org.ondedoar.adapter.response.openstreet.RouteResponseDto;

public interface OsrmRoutingService {
    RouteResponseDto getRoute(String startLat, String startLon, String endLat, String endLon);
}
