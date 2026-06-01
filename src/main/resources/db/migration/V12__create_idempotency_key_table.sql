CREATE TABLE idempotency_key
(
    id              BIGSERIAL PRIMARY KEY,
    idempotency_key VARCHAR(100) NOT NULL UNIQUE,
    user_id         VARCHAR(255) NOT NULL,
    created_at      TIMESTAMP    NOT NULL
);