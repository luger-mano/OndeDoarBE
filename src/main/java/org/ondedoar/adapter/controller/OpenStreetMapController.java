package org.ondedoar.adapter.controller;

import lombok.RequiredArgsConstructor;
import org.ondedoar.infra.api.openstreetmap.OpenStreetMapService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/route")
public class OpenStreetMapController {

    private final OpenStreetMapService openStreetMapService;

}
