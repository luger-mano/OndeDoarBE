CREATE TABLE tb_users (
    user_id UUID PRIMARY KEY,
    full_name VARCHAR(40) NOT NULL,
    phone VARCHAR(11) NOT NULL,
    mail VARCHAR(255) UNIQUE,
    password VARCHAR(255) NOT NULL,
    address_id BIGINT,
    date_birth DATE NOT NULL,
    blood_type VARCHAR(20),
    last_donation DATE,
    active BOOLEAN,

    CONSTRAINT fk_user_address
        FOREIGN KEY (address_id)
        REFERENCES tb_addresses(address_id)
        ON DELETE CASCADE
);