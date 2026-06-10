package org.ondedoar.domain.model.bloodcenter;

import jakarta.persistence.criteria.Join;
import org.springframework.data.jpa.domain.Specification;

import java.text.Normalizer;

public class BloodCenterSpecifications {

    public static Specification<BloodCenter> searchByTerm(String term) {

        return (root, query, cb) -> {

            if (term == null || term.isBlank()) {
                return cb.conjunction();
            }

            String pattern = "%" + BloodCenterSpecifications.normalize(term) + "%";


            Join<BloodCenter, BloodCenterAddress> addressJoin =
                    root.join("bloodCenterAddress");


            return cb.or(
                    cb.like(
                            cb.function(
                                    "unaccent",
                                    String.class,
                                    cb.lower(root.get("name"))
                            ),
                            pattern
                    ),

                    cb.like(
                            cb.function(
                                    "unaccent",
                                    String.class,
                                    cb.lower(addressJoin.get("fullAddress"))
                            ),
                            pattern
                    ),

                    cb.like(
                            cb.function(
                                    "unaccent",
                                    String.class,
                                    cb.lower(addressJoin.get("bairro"))
                            ),
                            pattern
                    ),

                    cb.like(
                            cb.function(
                                    "unaccent",
                                    String.class,
                                    cb.lower(addressJoin.get("municipio"))
                            ),
                            pattern
                    ),

                    cb.like(
                            cb.function(
                                    "unaccent",
                                    String.class,
                                    cb.lower(addressJoin.get("cep"))
                            ),
                            pattern
                    )
            );
        };
    }


    public static String normalize(String value) {
        if (value == null) {
            return null;
        }

        return Normalizer.normalize(value, Normalizer.Form.NFD)
                .replaceAll("\\p{M}", "")
                .toLowerCase();
    }
}
