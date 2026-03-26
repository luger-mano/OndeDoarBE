package org.ondedoar.adapter.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.ondedoar.adapter.request.security.LoginRequestDto;
import org.ondedoar.adapter.response.security.LoginResponseDto;
import org.ondedoar.domain.service.security.TokenService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.security.auth.login.CredentialException;

@RestController
@RequiredArgsConstructor
@RequestMapping("/login")
@Tag(name = "Token API", description = "Generates a token for a user")
public class TokenController {

    private final TokenService tokenService;


    @Operation(
            summary = "Sign in",
            description = "Check if the users credentials are correct"
    )
    @ApiResponses(
            value = {
                    @ApiResponse(responseCode = "200", description = "Logged-in user"),
                    @ApiResponse(responseCode = "204", description = "No resources found"),
                    @ApiResponse(responseCode = "401", description = "Unauthorized action"),
                    @ApiResponse(responseCode = "403", description = "User is not authorized"),
                    @ApiResponse(responseCode = "409", description = "There was a conflict in the action"),
                    @ApiResponse(responseCode = "500", description = "Throw CredentialException / Server side error")
            }
    )
    @PostMapping
    public ResponseEntity<LoginResponseDto> login(@RequestBody @Valid LoginRequestDto requestDto) throws CredentialException {
        LoginResponseDto responseDto = tokenService.generatesToken(requestDto);

        return ResponseEntity.ok(responseDto);
    }
}
