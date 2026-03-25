package org.ondedoar.domain.repository;

import org.ondedoar.domain.model.BloodCenter;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface BloodCenterRepository extends JpaRepository<BloodCenter, UUID> {
}
