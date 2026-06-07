INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Castro Alves 131 - 13424-367', 'Aclimação', '-23.567073416288615',
        '-46.63855151990882', 'CENTRO', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital A.C. Camargo', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 17h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 2189-5000'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Castro Alves 60 - 01532-000', 'Aclimação', '-23.567427117335463',
        '-46.63911057088798', 'CENTRO', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital do Servidor Publico Municipal', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 12h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3277-5303'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Maestro Cardim 1041 - 01323-130', 'Bela Vista', '-23.570083235797107',
        '-46.64191015897977', 'CENTRO', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Beneficência Portuguesa', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex- 7h às 18h/ sab - 7h às 12h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3505-1000'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Dr. Seng 320 1 subsolo', 'Bela Vista', '-23.560900097376507', '-46.65027992735557', 'CENTRO', 'SP',
        'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital IGESP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 18h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3147-6330'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Avenida Brigadeiro Luiz Antonio 683 / 2o Subsolo ', 'Bela Vista', '-23.556213155387066', '-46.63964754097925',
        'CENTRO', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Pérola Byington ', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 18h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3248-8000'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Dona Adma Jafet 91 - 01308-050', 'Bela Vista', '-23.557117079917173',
        '-46.65464558721673', 'CENTRO', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Sírio-Libanês', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 06h30 às 22h/ sab - 06h30 às 18h/ dom - 07h às 12h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3394-5260'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 3394-0200'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua João Julião 331 - 01323-020', 'Bela Vista', '-23.56858767381254',
        '-46.643212442403595', 'CENTRO', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Instituto HOC', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 07h às 22h/ sab - 08h às 15h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '0800 772 1227'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 3286-7372'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Peixoto Gomide 613- 1o subsolo ', 'Cerqueira Cesar', '-23.565053', '-46.661379',
        'CENTRO', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital 9 de Julho ', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'Atendimento 24h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3147-9999'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Avenida Dr. Enéas Carvalho de Aguiar 155 - 05403-000', 'Cerqueira Cesar',
        '-23.557586487113266', '-46.66896090232076', 'CENTRO', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Pró-Sangue (Unidade Clínicas)', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 17h30/ sab - 08h às 16h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '0800-55-0300'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 4573-7800'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Conselheiro Brotero 1486 - 01232-010', 'Higienópolis', '-23.539114645395884',
        '-46.661836802917456', 'OESTE', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Samaritano Higienópolis', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'Atendimento 24h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3821-5852'
FROM bc
UNION ALL
SELECT blood_center_id, '3821-5853'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Michel Ouchana 94 ', 'Jaçanã', '-23.4602835432851', '-46.58246533232765', 'NORTE', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Municipal São Luiz Gonzaga ', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'Atendimento 24h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3466-1000'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Avenida Brigadeiro Luís Antônio 2533 - 01401-000', 'Jardim Paulista',
        '-23.569579924867337', '-46.6505196249348', 'OESTE', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'CTA São Paulo - SP', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 07h às 19h/ sab  - 07h às 13h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3372-6611'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Peixoto Gomide 625 - 01409-001', 'Jardim Paulista', '-23.559614317466146',
        '-46.65533428197777', 'OESTE', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Serviço de Hemoterapia Hospital 9 de Julho', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 17h/ sab  - 08h às 12h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3285-2922'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 3147-9797'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Barão de Iguape 212 - 01507-000', 'Liberdade', '-23.558431389199885',
        '-46.63489478378197', 'OESTE', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemocentro São Lucas', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 16h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3660-6044'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Voluntários da Pátria 4227 ', 'Mandaqui', '-23.484491651097912', '-46.63034057666553', 'NORTE', 'SP',
        'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Mandaqui ', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'Atendimento 24h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '0800-55-0300'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Avenida Albert Einstein 627 - 05652-900', 'Morumbi', '-23.5990693521708',
        '-46.71489646282873', 'OESTE', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de Sangue do Hospital Albert Einstein', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 17h/ sab  - 08h às 16h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 2151-1233'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Abilio Soares 176 ', 'Paraíso', '-23.573569735479428', '-46.64335981604412', 'SUL', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital do Coração ', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 21h/ sab  - 07h às 18h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3053-6537'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Tomás Carvalhal 711 - 04006-002', 'Paraíso', '-23.577780025362248',
        '-46.6478920589179', 'SUL', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de Sangue de São Paulo', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 07h às 18h/ sab - 07h às 18h/ dom - 07h às 18h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3373-2050'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua tavares bastos 425 - 05012-020', 'Pompeia', '-23.534266051569105',
        '-46.68697712877745', 'OESTE', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Biotec Processamento do Sangue Ltda', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 16h30')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3674-4451'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 3674-4455'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 3674-4454'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Conselheiro Brotero 1486 - Térreo', 'Santa Cecília', '-23.539031037346668', '-46.66184021504896', 'CENTRO',
        'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Samaritano', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'Atendimento 24h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 38215852'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 3821 5853'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Voluntários da Pátria 3997 ', 'Santana', '-23.485756399696555', '-46.62867290426059', 'NORTE', 'SP',
        'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'São Camilo Santana ', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 07h às 21h/ sab  - 07h às 13h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11)2972-8000'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Iguatinga 382/386 04744-040', 'Santo Amaro', '-23.65595463737257',
        '-46.7055329930984', 'SUL', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de Sangue Paulista', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 16h30/ sab  - 08h às 16h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 5521-4013'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Avenida Celso Garcia 4815 - 03085-030', 'Tatuapé', '-23.532708968779815',
        '-46.56652763873117', 'LESTE', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Municipal Doutor Carmino Caricchio de Tatuapé', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'Atendimento 24h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 2942-8094'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 3394-7081'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 3394-6980'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 3394-7317'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 2942-8094'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Harry Dannenberg 473 - 08270-010', 'Vila Carmosina', '-23.554379709015073',
        '-46.46397512776769', 'LESTE', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Santa Marcelina', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 07h às 16h/ sab  - 07h às 12h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 2523-0546'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Dr. Diogo de Faria 824 - 04037-002', 'Vila Clementino',
        '-23.595512405234825', '-46.644655093772315', 'SUL', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemocentro HSP Unifesp', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 17h30/ sab  - 08h às 12h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 5576-4240'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Borges Lagoa 1450 ', 'Vila Clementino', '-23.59620470847653', '-46.65196930000301', 'SUL', 'SP',
        'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Professor Edmundo Vasconcelos ', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 17h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 5080-4435'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Pedro de Toledo 1800 - 04039-000', 'Vila Clementino', '-23.597365411275334',
        '-46.654469818169524', 'SUL', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Iamspe - (HSPE) Banco de Sangue do Hospital do Servidor Público Estadual', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 09h às 16h/ sab  - 08h às 16h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 5583-7001'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Marquês de Itu 579 - 01223-001', 'Vila Buarque', '-23.54382250385755',
        '-46.64997768842207', 'CENTRO', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemocentro da Santa Casa de São Paulo', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 07h às 17h/ sab  - 07h às 15h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 2176-7155'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Madre Cabrine 462 2o andar Bloco D ', 'Vila Mariana', '-23.592463779956677', '-46.638739023543756', 'SUL',
        'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hospital Israelita Albert Einstein - Vila Mariana', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 17h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 2151-7083'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Avenida Dr. Dante Pazzanese 500 - 04012-909', 'Vila Mariana',
        '-23.585324874667986', '-46.651334423062245', 'SUL', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Pró-Sangue Posto Dante Pazzanese', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 12h30/ sab  - 08h às 13h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '0800-55-0300'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 4573-7800'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Rua Dr. Alceu de Campos Rodrigues 46  - 04544-000', 'Vila Nova Conceição',
        '-23.58981837486613', '-46.6728595446497', 'SUL', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Banco de Sangue Paulista', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 08h às 16h30/ sab  - 08h às 16h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3048-8969'
FROM bc
UNION ALL
SELECT blood_center_id, '(11) 3048-8950'
FROM bc;

INSERT INTO tb_blood_center_addresses (full_address, bairro, latitude, longitude, zone, estado, regiao)
VALUES ('Avenida Santo Amaro 2468 - 04556-100', 'Vila Olímpia', '-23.605317844976053',
        '-46.67599075999036', 'SUL', 'SP', 'capital');

WITH bc AS (
INSERT
INTO tb_blood_centers (blood_center_id, name, blood_center_address_id, operation)
VALUES (gen_random_uuid(), 'Hemocentro São Lucas', currval('tb_blood_center_addresses_blood_center_address_id_seq'), 'seg à sex - 09h às 17h/ sab  - 10h às 14h')
    RETURNING blood_center_id
    )
INSERT
INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3660-5972'
FROM bc;