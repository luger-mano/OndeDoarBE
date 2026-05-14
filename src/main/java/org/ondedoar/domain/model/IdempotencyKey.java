package org.ondedoar.domain.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "idempotency_key",
        uniqueConstraints = {
        @UniqueConstraint(columnNames = "idempotency_key")
}
)
@Getter
@Setter
public class IdempotencyKey {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "idempotency_key", nullable = false, length = 100)
    private String idempotencyKey;

    @Column(name = "user_id", nullable = false)
    private String userId;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;


    @PrePersist
    public void prePersist() {
        this.createdAt = LocalDateTime.now();
    }

    public IdempotencyKey() {
    }

    public IdempotencyKey(Long id, String idempotencyKey, String userId, LocalDateTime createdAt) {
        this.id = id;
        this.idempotencyKey = idempotencyKey;
        this.userId = userId;
        this.createdAt = createdAt;
    }
}
