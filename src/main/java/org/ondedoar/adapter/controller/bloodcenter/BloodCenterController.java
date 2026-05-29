package org.ondedoar.adapter.controller.bloodcenter;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.ondedoar.adapter.request.openstreet.GeolocationStartingPointRequestDto;
import org.ondedoar.adapter.response.bloodcenter.BloodCenterResponseDto;
import org.ondedoar.adapter.response.address.NeighborhoodsZoneResponseDto;
import org.ondedoar.adapter.response.bloodcenter.NearestBloodCenterResponseDto;
import org.ondedoar.domain.service.bloodcenter.BloodCenterService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/centers")
@Tag(name = "Blood Center API", description = "Operations related to blood centers resource.")
public class BloodCenterController {

    private final BloodCenterService bloodCenterService;

    @GetMapping
    public ResponseEntity<List<BloodCenterResponseDto>> getAllBloodCenters() {
        var response = bloodCenterService.getAllBloodCenters();

        return ResponseEntity.ok(response);
    }

    @GetMapping("/filter/search")
    public ResponseEntity<List<BloodCenterResponseDto>> getBloodCentersBySearch(@RequestParam String search) {
        var response = bloodCenterService.getBloodCentersByAddressContainingIgnoreCase(search);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/filter/zone/neighborhoods")
    public ResponseEntity<List<NeighborhoodsZoneResponseDto>> getBloodCentersGroupedByZone() {
        var response = bloodCenterService.getBloodCentersGroupedByZone();

        return ResponseEntity.ok(response);
    }

    @GetMapping("/filter/nearest")
    public ResponseEntity<List<NearestBloodCenterResponseDto>> getNearestBloodCenters(
            @ModelAttribute GeolocationStartingPointRequestDto startingPointRequestDto) {

        var response =  bloodCenterService.getNearestBloodCenters(startingPointRequestDto);

        return ResponseEntity.ok(response);
    }
}
