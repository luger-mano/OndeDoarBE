CREATE TABLE tb_users (
    user_id UUID PRIMARY KEY,
    user_name VARCHAR(40) NOT NULL,
    middle_name VARCHAR(40) NOT NULL,
    phone VARCHAR(11) NOT NULL UNIQUE,
    mail VARCHAR(255) UNIQUE,
    password VARCHAR(255) NOT NULL,
    date_birth DATE,
    blood_type VARCHAR(20),
    brazilian_state VARCHAR(20),
    last_donation DATE,
    active BOOLEAN

);