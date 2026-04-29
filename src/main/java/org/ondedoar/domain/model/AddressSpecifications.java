package org.ondedoar.domain.model;

import org.ondedoar.domain.enums.Zone;
import org.springframework.data.jpa.domain.Specification;

public class AddressSpecifications {

    public static Specification<Address> filterColumn(String column, Object value){
        return (root, query, cb) -> {
            if (value == null || column == null) {
                return cb.conjunction();
            }
            if (column.equals("zone") &&  value instanceof String) {
                return cb.equal(root.get(column.toLowerCase()), Zone.valueOf(((String) value).toUpperCase()));
            }

            return cb.equal(root.get(column.toLowerCase()), value);
        };
    }
}
