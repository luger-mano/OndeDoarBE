package org.ondedoar.utils.mapper;

import org.mapstruct.Mapper;
import org.ondedoar.adapter.request.user.UserCreatedRequestDto;
import org.ondedoar.adapter.response.user.UserCreatedResponseDto;
import org.ondedoar.domain.model.User;

@Mapper(componentModel = "spring")
public interface UserMapper {

    User userCreatedRequestToUser(UserCreatedRequestDto userCreatedRequestDto);
    UserCreatedResponseDto userToUserCreatedResponseDto(User user);
}
