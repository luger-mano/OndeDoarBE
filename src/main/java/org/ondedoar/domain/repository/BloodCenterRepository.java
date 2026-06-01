package org.ondedoar.domain.repository;

import io.lettuce.core.dynamic.annotation.Param;
import org.ondedoar.domain.model.bloodcenter.BloodCenter;
import org.ondedoar.utils.bloodcenter.ZoneNeighborhoodCount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface BloodCenterRepository extends JpaRepository<BloodCenter, UUID>, JpaSpecificationExecutor<BloodCenter> {

    List<BloodCenter> findAllByOrderByNameAsc();


    @Query("SELECT a.zone as zone, COUNT(DISTINCT a.bairro) as bairroCount " +
            "FROM BloodCenter bc " +
            "JOIN bc.bloodCenterAddress a " +
            "WHERE a.zone IS NOT NULL AND a.bairro IS NOT NULL " +
            "AND UPPER(TRIM(a.regiao)) = UPPER(TRIM(:regiao)) " +
            "GROUP BY a.zone " +
            "ORDER BY CASE WHEN a.zone = 'CENTRO' THEN 0 ELSE 1 END ASC, " +
            "COUNT(DISTINCT a.bairro) DESC")
    List<ZoneNeighborhoodCount> findZonesOrderedByCustomLogic(@Param("regiao") String regiao);

    List<BloodCenter> findAllByBloodCenterAddressRegiaoIgnoreCaseOrderByNameAsc(String regiao);
}
