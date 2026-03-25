package org.ondedoar.adapter.controller;

import lombok.RequiredArgsConstructor;
import org.ondedoar.adapter.request.user.UserCreatedRequestDto;
import org.ondedoar.adapter.response.user.UserCreatedResponseDto;
import org.ondedoar.domain.service.user.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @PostMapping("/users")
    public ResponseEntity<UserCreatedResponseDto> createUser(@RequestBody UserCreatedRequestDto requestDto) {
        var user = userService.createUser(requestDto);
        return ResponseEntity.ok(user);
    }

}
