package org.ondedoar.adapter.controller;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.ondedoar.adapter.response.bloodcenter.BloodCenterResponseDto;
import org.ondedoar.domain.service.bloodcenter.BloodCenterService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/center")
@Tag(name = "Blood Center API", description = "Operations related to blood centers resource.")
public class BloodCenterController {

    private final BloodCenterService bloodCenterService;

    @GetMapping
    public ResponseEntity<List<BloodCenterResponseDto>> getAllBloodCenters(){
        var response = bloodCenterService.getAllBloodCenters();

        return ResponseEntity.ok(response);
    }
}
