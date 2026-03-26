package org.ondedoar.adapter.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
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
@RequiredArgsConstructor
@RequestMapping("/user")
@Tag(name = "User API", description = "Operations related to users resource.")
public class UserController {

    private final UserService userService;


    @Operation(
            summary = "Create user",
            description = "Creates a new user resource in the system."
    )
    @ApiResponses(
            value = {
                    @ApiResponse(responseCode = "200", description = "User created"),
                    @ApiResponse(responseCode = "204", description = "User created with empty resource"),
                    @ApiResponse(responseCode = "401", description = "Unauthorized action"),
                    @ApiResponse(responseCode = "409", description = "There was a conflict in the action"),
                    @ApiResponse(responseCode = "500", description = "Throw an exception / Server side error")
            }
    )
    @PostMapping
    public ResponseEntity<UserCreatedResponseDto> createUser(@RequestBody @Valid UserCreatedRequestDto requestDto) {
        var user = userService.createUser(requestDto);
        return ResponseEntity.ok(user);
    }

}
