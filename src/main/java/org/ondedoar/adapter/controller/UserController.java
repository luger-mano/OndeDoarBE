package org.ondedoar.adapter.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.mail.MessagingException;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.ondedoar.adapter.request.user.ResetPasswordRequestDto;
import org.ondedoar.adapter.request.user.UserCreatedRequestDto;
import org.ondedoar.adapter.request.user.UserUpdatedRequestDto;
import org.ondedoar.adapter.response.security.LoginResponseDto;
import org.ondedoar.adapter.response.user.UserResponseDto;
import org.ondedoar.domain.service.user.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.UUID;


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
    public ResponseEntity<Map<String, String>> createUser(@RequestHeader("x-idempotency-key") String idempotencyKeyHeader,
                                                          @RequestBody @Valid UserCreatedRequestDto requestDto) throws MessagingException {
        var user = userService.createUser(idempotencyKeyHeader, requestDto);
        return ResponseEntity.ok(user);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Map<String, String>> updateUser(@PathVariable UUID id,
                                                          @RequestBody @Valid UserUpdatedRequestDto requestDto,
                                                          JwtAuthenticationToken token) {
        var user = userService.updateUser(id, requestDto, token);

        return ResponseEntity.ok(user);
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserResponseDto> getById(@PathVariable UUID id) {
        var user = userService.getUserById(id);

        return ResponseEntity.ok(user);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Map<String, String>> deleteById(@PathVariable UUID id,
                                                          JwtAuthenticationToken token) {
        var user = userService.deleteUserById(id, token);

        return ResponseEntity.ok(user);
    }

    @PostMapping("/password/forgot")
    public ResponseEntity<Void> forgotPassword(@RequestParam String mail) throws MessagingException {
        userService.sendPasswordResetMail(mail);

        return ResponseEntity.noContent().build();
    }

    @PutMapping("/password/reset")
    public ResponseEntity<Map<String, String>> resetPasswordByToken(@RequestParam String token,
                                                                    @RequestBody ResetPasswordRequestDto requestDto) {
        var user = userService.resetPasswordByToken(token, requestDto);

        return ResponseEntity.ok(user);
    }

    @GetMapping("/email/verify")
    public ResponseEntity<LoginResponseDto> verifyEmail(@RequestParam String token) {

        var user = userService.verifyEmail(token);

        return ResponseEntity.ok(user);
    }
}
