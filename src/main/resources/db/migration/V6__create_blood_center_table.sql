CREATE TABLE tb_blood_centers (
    blood_center_id UUID PRIMARY KEY,
    name VARCHAR(255),
    blood_center_address_id BIGINT,
    operation TIME,
    blood_stock DOUBLE PRECISION,

    CONSTRAINT fk_blood_center_address
        FOREIGN KEY (blood_center_address_id)
        REFERENCES tb_blood_center_addresses(blood_center_address_id)
        ON DELETE CASCADE
);