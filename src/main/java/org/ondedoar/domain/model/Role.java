package org.ondedoar.domain.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "tb_roles")
@Getter
@Setter
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long roleId;

    private String name;

    @Getter
    public enum Values{
        SUPER_ADMIN(1L),
        ADMIN(2L),
        CLIENT(3L);

        final long roleId;

        Values(long roleId) {
            this.roleId = roleId;
        }
    }

    public Role(Long roleId, String name) {
        this.roleId = roleId;
        this.name = name;
    }

    public Role() {
    }
}
