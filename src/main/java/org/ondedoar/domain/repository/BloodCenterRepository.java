package org.ondedoar.domain.repository;

import org.ondedoar.domain.model.bloodcenter.BloodCenter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.UUID;

public interface BloodCenterRepository extends JpaRepository<BloodCenter, UUID>, JpaSpecificationExecutor<BloodCenter> {

}
