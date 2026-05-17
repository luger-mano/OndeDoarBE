package org.ondedoar.adapter.controller;

import lombok.RequiredArgsConstructor;
import org.ondedoar.adapter.response.address.AddressFilterRegionsResponseDto;
import org.ondedoar.domain.service.address.BloodCenterAddressService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/address")
public class BloodCenterAddressController {

    private final BloodCenterAddressService bloodCenterAddressService;

    @GetMapping("/filter/region")
    public ResponseEntity<List<AddressFilterRegionsResponseDto>> filterByRegion(@RequestParam String filter, @RequestParam String value) {
        var address = bloodCenterAddressService.filterByRegion(filter, value);

        return ResponseEntity.ok(address);
    }
}
