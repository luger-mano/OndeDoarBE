package org.ondedoar.domain.repository;

import org.ondedoar.domain.model.bloodcenter.BloodCenterAddress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface BloodCenterAddressRepository extends JpaRepository<BloodCenterAddress, Long>, JpaSpecificationExecutor<BloodCenterAddress> {
}
