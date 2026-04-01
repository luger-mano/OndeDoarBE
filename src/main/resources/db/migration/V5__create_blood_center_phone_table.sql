CREATE TABLE tb_blood_center_phone (
    id BIGSERIAL PRIMARY KEY,
    blood_center_id UUID NOT NULL,
    phone VARCHAR(20) NOT NULL,

    CONSTRAINT fk_phone_blood_center
        FOREIGN KEY (blood_center_id)
        REFERENCES tb_blood_centers(blood_center_id)
        ON DELETE CASCADE
);

