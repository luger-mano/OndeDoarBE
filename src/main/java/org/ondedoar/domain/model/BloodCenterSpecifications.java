package org.ondedoar.domain.model;

import jakarta.persistence.criteria.Join;
import org.springframework.data.jpa.domain.Specification;

public class BloodCenterSpecifications {

    public static Specification<BloodCenter> searchByTerm(String term) {
        return (root, query, cb) -> {
            if (term == null || term.isBlank()) {
                return cb.conjunction();
            }

            String pattern = "%" + term.toLowerCase() + "%";

            Join<BloodCenter, BloodCenterAddress> addressJoin = root.join("bloodCenterAddress");

            return cb.or(
                    cb.like(cb.lower(root.get("name")), pattern),
                    cb.like(cb.lower(addressJoin.get("fullAddress")), pattern),
                    cb.like(cb.lower(addressJoin.get("bairro")), pattern),
                    cb.like(cb.lower(addressJoin.get("municipio")), pattern),
                    cb.like(cb.lower(addressJoin.get("cep")), pattern)
            );
        };
    }

}
