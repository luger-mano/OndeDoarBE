package org.ondedoar.utils.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.ondedoar.adapter.request.user.UserCreatedRequestDto;
import org.ondedoar.adapter.response.user.UserResponseDto;
import org.ondedoar.domain.model.User;

@Mapper(componentModel = "spring")
public interface UserMapper {

    @Mapping(target = "userName", source = "userName")
    User userCreatedRequestToUser(UserCreatedRequestDto userCreatedRequestDto);

    UserResponseDto userToUserResponseDto(User user);
}
