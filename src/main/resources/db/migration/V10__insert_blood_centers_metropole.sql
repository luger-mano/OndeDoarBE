-- METROPOLE
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Ângela Mirella 354 - Jardim Barueri Barueri - SP 06411-330', 'Barueri', '-23.496594373423395',
        '-46.872630644112455', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'Pró-Sangue - Barueri - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 17h'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '0800 55 0300'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 4573-7800'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Estrada de Itapecerica 1661 - Vila Maracana - São Paulo - SP 05835-005', 'Campo Limpo', '-23.648855830323726',
        '-46.74883573293573', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'COLSAN - Campo Limpo - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 13h (exceto feriados)'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 5812-1379'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Henry Borden s/n - Vila Santa Rosa Cubatão - SP 11515-000', 'Cubatão', '-23.890345918677657',
        '-46.42097890782506', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'Hospital de Cubatão - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 07h às 13h'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(13) 3388 4887'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua José Bonifácio 1641 - Serraria Diadema - SP 09960-120', 'Diadema', '-23.706485270609843',
        '-46.60931470246659', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'Banco de Sangue do Hospital Estadual - Diadema - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 14h'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 3583-1400'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Maria Cândida Pereira 568 - Vila Itapegica Guarulhos - SP 07041-020', 'Guarulhos', '-23.478666929205342',
        '-46.5515210012654', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'Hemocentro Guarulhos Hospital Stella Maris - Guarulhos - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 16h'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 2423-8551'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 2423-8500'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua  Santo Antônio 95 - CENTRO Guarulhos - SP 07110-110', 'Guarulhos', '-23.467639015379756',
        '-46.52487354465165', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'Hemocentro São Lucas - Guarulhos - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sab - 07h às 18h'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 3660-6040'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua  Anchieta 66 - Vila Boaventura Jundiaí - SP 17490-050', 'Jundiaí', '-23.18673139621514',
        '-46.888193840200884', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'Bioclínica Análises Clínicas - Jundiaí - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 06h às 11h/ sab  - 06h às 10h'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 4586-3600'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua XV de Novembro 1848 - Vila Mun.Jundiaí - SP 13201-305', 'Jundiaí', '-23.180560443775427',
        '-46.88415388972932', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'COLSAN - Jundiaí - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sab - 07h30 às 12h30'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 4521-4025'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Dr. Henrique Calderazzo 321 - Paraíso - Santo André - SP 09190-615', 'Santo André', '-23.67063338208694',
        '-46.53301534649501', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'Banco de Sangue Hospital Mário Covas - Santo André - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sab - 08h às 13h (exceto feriados)'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 2829-5162'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 2829-5144'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida dos Andradas 444 - Vila Santa Teresa Santo André - SP 09030-350', 'Santo André', '-23.66883458318443',
        '-46.52753158486126', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'Hemocentro São Lucas - Santo André - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 16h15/ sab  - 08h às 12h'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 3660-5994'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Pedro Jacobucci 440 - Jardim das AmericasSão Bernardo do Campo - SP 09725-750', 'São Bernardo do Campo',
        '-23.698708951024127', '-46.555513588824205', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'COLSAN - São Bernado do Campo - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 07h30 às 14h30/ sab  - 07h30 às 13h30'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 4332-3900'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Mediterrâneo 470 - Jardim do Mar São Bernardo do Campo - SP 09750-420', 'São Bernardo do Campo',
        '-23.69120807867155', '-46.55410337422158', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'Hemocentro São Lucas - São Bernardo do Campo - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sab - 08h às 17h'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 3660-5968'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 3660-6000'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua  Peri 361 - Santa Paula São Caetano do Sul - SP 09540-290', 'São Caetano do Sul', '-23.624740921365976',
        '-46.56447583300151', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'COLSAN - São Caetano do Sul - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sab - 08h às 12h (exceto feriados)'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 4227-1083'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Antônio Marques Figueira s/n - Vila Figueira Suzano - SP 08676-000', 'Suzano', '-23.539220562153158',
        '-46.30630002824804', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'Hemocentro Suzano - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 09h às 13h/ sab  - 09h às 12h'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 4752-9999'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 94442-7993'
FROM bc
;

INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Ari Barroso 355 - Pres. Altino Osasco - SP 06216-240', 'Osasco', '-23.524979141410473',
        '-46.77166704039158', 'SP', 'metropole');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (
    gen_random_uuid(), 'Pró-Sangue - Osasco - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 16h30/ sab  - 08h às 16h'
    )
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '0800-55-0300'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 4573-7800'
FROM bc
;