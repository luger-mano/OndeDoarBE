-- INTERIOR
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Joaquim Luís Vian 209 - 17800-000', 'Adamantina', '-21.692189270740332',
        '-51.068800568424166', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'UCT Adamantina - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 15h/ sab - 07h às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 3521-2500'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida da Saúde 415 Jardim - 13478-640', 'Americana',
        '-22.742282201760016', '-47.308764315828164', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Municipal de Americana', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 12h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3468-1739'
FROM bc
UNION ALL
SELECT blood_center_id, '(19) 3471-6750'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Gaspar de Lemos 2 - 16013-800', 'Araçatuba', '-21.228339658549217',
        '-50.41609216221205', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de Sangue de Araçatuba', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 18h/ sab - 07h às 16h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 3607-3935'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Rua Arthur Ferreira da Costa 330 - 16055-500', 'Araçatuba',
        '-21.19293120858644', '-50.431417305009376', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Núcleo de Hemoterapia de Araçatuba', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 18h/ sab - 07h às 16h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 2102-9400'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida da Saudade 58 - 14801-360', 'Araçatuba', '-21.794063443303195',
        '-48.18141892887494', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemonúcleo Regional de Araraquara', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 18h/ sab - 07h às 16h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3301-6102'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Praça Dr. Symphronio Alves dos Santos s/n 19800-000', 'Assis', '-22.66019112552379',
        '-50.41011343039835', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Unidade de Coleta e Transfusão do Hospital Regional Famema', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sab - 07h às 12h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 3302-6000'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Dr. Manoel Furtado 235 - 14300-000', 'Batatais', '-20.88857284471923',
        '-47.58367780258088', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Unidade de Hemoterapia', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sab - 07h às 10h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3761-4004'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Marcos Augusto Genovez Serra 251 - 17012-647', 'Bauru', '-22.34241397771977',
        '-49.047922152609644', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemonúcleo de Bauru', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 15h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3234-4412'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Monsenhor Claro 8-88 - 17010-260', 'Bauru', '-22.329809663783866', '-49.07674360278029',
        'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemonúcleo do Hospital de Base', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 15h31')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3234-4412'
FROM bc
UNION ALL
SELECT blood_center_id, '(14) 3227-2942'
FROM bc
UNION ALL
SELECT blood_center_id, '(14) 3231-4771'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Antenor Duarte Viléla 1331 - 14784-400', 'Barretos', '-20.587214331915717',
        '-48.569211352197655', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemonúcleo', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a dom - 07h às 13h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3321 6600'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Raul Furquim 2010 - 14706-045', 'Bebedouro', '-20.93466142321199',
        '-48.496487604500416', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Unidade de Hemoterapia', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sab - 07h às 11h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3342-8817'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Campus de Avenida Rubião Jr s/n - 18600-400', 'Botucatu', '-22.889105446170525',
        '-48.49559083075703', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemocentro De Botucatu', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 08h às 16h30/ sab - 07h às 12h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3811-6234'
FROM bc
UNION ALL
SELECT blood_center_id, '(14) 3811-6041'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida São Francisco de Assis 260 - 12916-542',
        'Bragança Paulista', '-22.979724704042788', '-46.534414541732176', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemonúcleo Regional USF Hospital Universitário São Francisco de Assis', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 17h/ sab - 07h às 15h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 2490-1240'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Júlio de Mesquita 571 - Cambuí Campinas - SP 13010-140', 'Campinas', '-22.827843069604747',
        '-47.06376604381902', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'CENTRO de Hematologia e Hemoterapia', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sab - 07h30 às 15h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 2514-1555'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Carlos Chagas 480 - 13083-878', 'Campinas', '-22.82879421034253',
        '-47.06376575564588', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemocentro da UNICAMP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sab - 07h30 às 15h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '0800-722-8432'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Pref. Faria Lima 340 - 13036-902', 'Campinas', '-22.916101853044157',
        '-47.068551283588306', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Municipal Dr. Mário Gatti', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sab - 07h30 às 15h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3272-5501'
FROM bc
UNION ALL
SELECT blood_center_id, '(19) 3772-5758'
FROM bc
UNION ALL
SELECT blood_center_id, '(19) 3772-5700'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Treze de Maio 974 - 15800-010', 'Catanduva', '-21.139992163452614',
        '-48.97641541769928', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemonúcleo', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'ter a domingo - 07h às 13h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3522-7722'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Virgílio Pagnozi 822 - 17900-000', 'Dracena', '-21.478587865336845',
        '-51.53717675836433', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'UCT Dracena - Santa Casa de Misericórdia e Maternidade de Dracena', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 10h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 3822-1716'
FROM bc
UNION ALL
SELECT blood_center_id, '(18) 5822-3500'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Alameda Rodrigo de Brum 1989 - 03807-230', 'Ermelino Matarazzo',
        '-23.499774024355375', '-46.472329843727756', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Municipal Ermelino Matarazzo', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sab - 08h às 13h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 2545-4652'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 3394-8030'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua  Simão dos Santos Gomes 266 - 15600-000', 'Fernandópolis',
        '-20.29486771040057', '-50.24738462170416', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Núcleo de Hemoterapia de Fernandópolis', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 08h às 17h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3442-5544'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Dr. Hélio Palermo 4181 - 14409-045', 'Franca', '-20.519360863223746',
        '-47.394258504034504', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Núcleo de Hemoterapia de Franca', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 08h às 17h/ sab - 07h às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3402 5000'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Quinto Bertoldi 40 - 11410-010', 'Guarujá', '-23.990754803964176',
        '-46.25346188368592', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de Sangue HSA', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 12h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(13) 3389-1515'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Mario Prandini 935 - 18405-020', 'Itapeva', '-23.988399315893083',
        '-48.877634874122975', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de Sangue de Itapeva', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 14h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(15) 3522-0934'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Doná Silvéria 150 - 17210-070', 'Jaú', '-22.291502995719586',
        '-48.55000914335151', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Amaral Carvalho', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h30 às 15h/ sab - 07h30 às 12h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14)3602-1355'
FROM bc
UNION ALL
SELECT blood_center_id, '3602-1356'
FROM bc
UNION ALL
SELECT blood_center_id, '(14) 3602-1200'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Antonio Ometto 675 - 13480-470', 'Limeira', '-22.57939363422755',
        '-47.40016984182506', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de Sangue da Santa Casa', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 14h/ sab - 07h às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3446-6115'
FROM bc
UNION ALL
SELECT blood_center_id, '(19) 3446- 6124'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Pedro de Toledo 486 - 16403-265', 'Lins', '-21.671979049868757',
        '-49.75523146312086', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'UCT Lins', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sab - 07h às 11h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3533-2500'
FROM bc
UNION ALL
SELECT blood_center_id, '(14) 3532-5087'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Lourival Freire 240 - 17519-050', 'Marília', '-22.224905384742918',
        '-49.93795339672109', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'FAMEMA - Marília', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sab - 07h às 13h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3434-2541'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Barão de Jaceguai 1148 - 08780-906', 'Mogi das Cruzes', '-23.521526847722455',
        '-46.18687002133836', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Santa Casa de Mogi das Cruzes', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h30 às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 4799-2892'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 4728-4700'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Síria 190 - 5400-000', 'Olímpia', '-20.736527356045965', '-48.91802032697495', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Unidade de Hemoterapia de Olímpia', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sab - 07h às 12h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3281-9080'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Joaquim de Azevedo 604 - 19900-280', 'Ourinhos', '-22.98485168888676',
        '-49.86500547985864', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de Sangue Ourinhos', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 15h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3302-2245'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Silva Jardim 1700 - 13419-140 (Antigo prédio do ‘Saúde Inteligente’ dentro do complexo da Santa Casa)',
        'Piracicaba', '-22.73613701916124', '-47.64196761610465', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemonúcleo de Piracicaba', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h30 às 13h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3422-2019'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida da Saudade 1299 Pirangi - 15820-000', 'Pirangi', '-21.089082251043095', '-48.66126672786286', 'SP',
        'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Laboratório Hemopacli', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 17h/ sab - 07h às 08h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3386-1770'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Cel. José Soares Marcondes 2063 - 19010-089', 'Presidente Prudente',
        '-22.12896941003021', '-51.3916658583481', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Instituto Rh Hematologia e Hemoterapia', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 16h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 3226-1555'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Wenceslau Braz 5 - 19014-030', 'Presidente Prudente',
        '-22.12947180726716', '-51.392401374910314', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Núcleo de Hemoterapia de Presidente Prudente', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 16h/ sab - 07h às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 3223-3511'
FROM bc
UNION ALL
SELECT blood_center_id, '(18) 3223-4490'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Quintino Bocaiuva 470 - 14015-160', 'Ribeirão Preto', '-21.186574109177347',
        '-47.80806224653398', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de Sangue Ribeirão Preto', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a dom - 07h às 12h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3610-8929'
FROM bc
UNION ALL
SELECT blood_center_id, '(16) 3610-5822'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Tenente Catão Roxo 2501 - 14051-140', 'Ribeirão Preto',
        '-21.160318928566696', '-47.848559714005695', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'HEMOCENTRO RP (Campus USP)', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a dom - 07h às 12h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 2101-9352'
FROM bc
UNION ALL
SELECT blood_center_id, '0800-979-6049'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Quintino Bocaiuva 975 - 4015-160', 'Ribeirão Preto', '-21.18936151510267',
        '-47.804153305214896', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'GSH Banco de Sangue de Ribeirão Preto', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a dom - 07h às 12h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3610-1515'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Altíno Arantes 656 - 14025-120', 'Ribeirão Preto', '-21.186188106827093',
        '-47.81473097119368', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemac Ribeirão Preto ', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a dom - 07h às 12h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 99267-6541'
FROM bc
UNION ALL
SELECT blood_center_id, '(16) 3610-1211'
FROM bc
UNION ALL
SELECT blood_center_id, '(16) 2138-3298'
FROM bc
UNION ALL
SELECT blood_center_id, '(16) 2138-3004'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Dois 297 - 13500-330', 'Rio Claro', '-22.415416252124498', '-47.5567940550812',
        'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de sangue da Santa Casa de Misericórdia', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg e qua e sex - 07h às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3535-7022'
FROM bc
UNION ALL
SELECT blood_center_id, '(19) 3535-7000'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Paulino Botelho de Abreu Sampaio 535 - 13561-060', 'São Carlos',
        '-22.01196744261255', '-47.901116100176814', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Santa Casa', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 08h às 12h/ sab - 08h às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3509-1100'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida João Osório 701 - 13870-251', 'São João da Boa Vista',
        '-21.9821585441285', '-46.79584175209147', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Bioclínica Banco de Sangue', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h30 às 13h/ sab - 07h às 11h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3633-7036'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Jamil Feres Kfouri 80 - 15091-240', 'São José do Rio Preto',
        '-20.827110447106094', '-49.40010608702224', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemocentro São José do Rio Preto', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a dom 07h às 13h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3201-5151'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Luíz Vaz de Camões 3150 - 5015-750', 'São José do Rio Preto',
        '-20.82179739839853', '-49.390010276934014', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Beneficência Portuguesa de São José do Rio Preto', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a dom 07h às 13h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3211-5454'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Antônio Saes 425 - 12210-040', 'São José do Rio Preto',
        '-23.187053402994582', '-45.88174780232667', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Serviço de Hematologia e Hemoterapia de São José dos Campos', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a dom 07h às 13h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(12) 3519-3766'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Dr. Cláudio Luiz da Costa 50 - 11075-101', 'Santos', '-23.945567652357543',
        '-46.33671885483469', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de Sangue da Santa Casa', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 12h30/ sab - 07h às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(13) 3202-0600'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Pedro Américo 60 - 11075-400', 'Santos', '-23.956996956639212',
        '-46.333782486629836', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de Sangue do Hospital Ana Costa', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 12h30/ sab - 07h às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(13) 3226-9252'
FROM bc
UNION ALL
SELECT blood_center_id, '(13) 3228-9000'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Dr. Armando Salles de Oliveira 138 - 11050-070', 'Santos', '-23.962554349551326',
        '-46.3251979374293', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Casa de Saúde Santos', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 12h30/ sab - 07h às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(13) 3202-7900'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Oswaldo Cruz 197 - Boqueirão - 11045-101', 'Santos', '-23.96140243503292',
        '-46.321063397426066', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'COLSAN Santos ', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 12h30/ sab - 07h às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(13) 3223-2860'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Epitácio Pessoa 1401 - 14160-180', 'Sertãozinho', '-21.136252689706666',
        '-47.99332486763295', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de Sangue de Sertãozinho', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h às 17h/ sab - 07h às 13h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3942-3404'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Comendador Pereira Inácio 564 - 18030-005', 'Sorocaba',
        '-23.510516913126096', '-47.45684417428096', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'COLSAN Sorocaba', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sab - 07h30 às 12h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(15) 3224-2930'
FROM bc
UNION ALL
SELECT blood_center_id, '(15) 3332-9461'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida da Amizade 2400 - 13175-490', 'Sumaré', '-22.8166388785474',
        '-47.24170615558801', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Estadual Sumaré', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sab - 07h30 às 12h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3883-8909'
FROM bc
UNION ALL
SELECT blood_center_id, '(19) 3883-8900'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Ibirama 1214 - 06785-300', 'Taboão da Serra',
        '-23.640469997941512', '-46.80987265181835', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Geral de Pirajussara', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a quinta - 07h às 16h/ sex - 07h às 12h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 3583-9400'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida Inglaterra 190 - 12030-450', 'Taubaté', '-23.031189538132285',
        '-45.57075078698826', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Núcleo de Hemoterapia Taubaté', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 08h às 16h/ sab - 07h às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(12) 3624 1273'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Manoel Ferreira Damião 444 - 17625-005', 'Tupã', '-21.924505684409784',
        '-50.518353834927844', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'UCT Tupã Santa Casa da Misericórdia', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg a sex - 07h30 às 12h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3496-1022'
FROM bc
UNION ALL
SELECT blood_center_id, '(14) 3496-1177'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Rua Antônio Galera Lopes 2652 - 15503-024', 'Votuporanga', '-20.400049828139053',
        '-49.97194343101954', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemocentro de Votuporanga', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'ter - 15h às 18h/ qui a sab - 08h às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3423-2986'
FROM bc
;
INSERT INTO tb_blood_center_addresses (full_address, municipio, latitude, longitude, estado, regiao)
VALUES ('Avenida da Saudade 2603 - 15501-405', 'Votuporanga', '-20.426936027093895',
        '-49.98144092776928', 'SP', 'interior');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Unidade de Coleta de Votuporanga', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'ter - 14h30 às 17h30/ qui - 08h às 11h/ 1º sábado - 08h às 11h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3423-2986'
FROM bc
;

