package org.ondedoar.infra.api.openstreetmap;

import org.ondedoar.adapter.request.user.UserCoordinatesRequestDto;
import org.ondedoar.adapter.response.user.UserCoordinatesResponseDto;

public interface UserGeolocationService {
    UserCoordinatesResponseDto returnCoordinatesByLogradouroAndLocalidadeAndCep(UserCoordinatesRequestDto requestDto);
}
