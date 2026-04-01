INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Castro Alves 131 - Aclimação - São Paulo - SP 13424-367', 'Aclimação', '-23.567073416288615', '-46.63855151990882', 'CENTRO');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital A.C. Camargo - São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 2189-5000' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Castro Alves 60 - Aclimação São Paulo - SP 01532-000', 'Aclimação', '-23.567427117335463', '-46.63911057088798', 'CENTRO');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital do Servidor Publico Municipal - São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3277-5303' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Maestro Cardim 1041 - Bela Vista São Paulo - SP 01323-130', 'Bela Vista', '-23.570083235797107', '-46.64191015897977', 'CENTRO');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Beneficência Portuguesa de São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3505-1000' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Dr. Seng 320 1 subsolo', 'Bela Vista', '-23.560900097376507', '-46.65027992735557', 'CENTRO');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital IGESP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3147-6330' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Avenida Brigadeiro Luiz Antonio 683 / 2o Subsolo ', 'Bela Vista', '-23.556213155387066', '-46.63964754097925', 'CENTRO');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Pérola Byington ', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3248-8000' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Dona Adma Jafet 91 - Bela Vista São Paulo - SP 01308-050', 'Bela Vista', '-23.557117079917173', '-46.65464558721673', 'CENTRO');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Sírio-Libanês - Bela Vista - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3394-5260' FROM bc
UNION ALL SELECT blood_center_id, '(11) 3394-0200' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua João Julião 331 - Bela Vista São Paulo - SP 01323-020', 'Bela Vista', '-23.56858767381254', '-46.643212442403595', 'CENTRO');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Instituto HOC - Bela Vista - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '0800 772 1227' FROM bc
UNION ALL SELECT blood_center_id, '(11) 3286-7372' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Peixoto Gomide 613- 1o subsolo- Cerqueira César-São Paulo-SP ', 'Cerqueira Cesar', 'null', 'null', 'CENTRO');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital 9 de Julho ', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3147-9999' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Avenida Dr. Enéas Carvalho de Aguiar 155 - Cerqueira César São Paulo - SP 05403-000', 'Cerqueira Cesar', '-23.557586487113266', '-46.66896090232076', 'CENTRO');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Pró-Sangue - São Paulo (Unidade Clínicas) - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '0800-55-0300' FROM bc
UNION ALL SELECT blood_center_id, '(11) 4573-7800' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Conselheiro Brotero 1486 - Higienópolis São Paulo - SP 01232-010', 'Higienópolis', '-23.539114645395884', '-46.661836802917456', 'OESTE');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Samaritano Higienópolis - São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3821-5852' FROM bc
UNION ALL SELECT blood_center_id, '3821-5853' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Michel Ouchana 94 ', 'Jaçanã', '-23.4602835432851', '-46.58246533232765', 'NORTE');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Municipal São Luiz Gonzaga ', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3466-1000' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Avenida Brigadeiro Luís Antônio 2533 - Jardim Paulista São Paulo - SP 01401-000', 'Jardim Paulista', '-23.569579924867337', '-46.6505196249348', 'OESTE');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'CTA São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3372-6611' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Peixoto Gomide 625 - Jardim Paulista São Paulo - SP 01409-001', 'Jardim Paulista', '-23.559614317466146', '-46.65533428197777', 'OESTE');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Serviço de Hemoterapia Hospital 9 de Julho - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3285-2922' FROM bc
UNION ALL SELECT blood_center_id, '(11) 3147-9797' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Barão de Iguape 212 - Liberdade São Paulo - SP 01507-000', 'Liberdade', '-23.558431389199885', '-46.63489478378197', 'OESTE');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemocentro São Lucas - Liberdade - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3660-6044' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Voluntários da Pátria 4227 ', 'Mandaqui', '-23.484491651097912', '-46.63034057666553', 'NORTE');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Mandaqui ', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '0800-55-0300' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Avenida Albert Einstein 627 - Morumbi São Paulo - SP 05652-900', 'Morumbi', '-23.5990693521708', '-46.71489646282873', 'OESTE');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue do Hospital Albert Einstein - São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 2151-1233' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Abilio Soares 176 ', 'Paraíso', '-23.573569735479428', '-46.64335981604412', 'SUL');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital do Coração ', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3053-6537' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Tomás Carvalhal 711 - Paraíso São Paulo - SP 04006-002', 'Paraíso', '-23.577780025362248', '-46.6478920589179', 'SUL');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue de São Paulo – Jd Paulista - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3373-2050' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua tavares bastos 425-CEP 05012-020- Vila Pompéia-São Paulo- SP', 'Pompeia', '-23.534266051569105', '-46.68697712877745', 'OESTE');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Biotec Processamento do Sangue Ltda', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3674-4451' FROM bc
UNION ALL SELECT blood_center_id, '(11) 3674-4455' FROM bc
UNION ALL SELECT blood_center_id, '(11) 3674-4454' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Conselheiro Brotero 1486 – Térreo', 'Santa Cecília', '-23.539031037346668', '-46.66184021504896', 'CENTRO');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Samaritano', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 38215852' FROM bc
UNION ALL SELECT blood_center_id, '(11) 3821 5853' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Voluntários da Pátria 3997 ', 'Santana', '-23.485756399696555', '-46.62867290426059', 'NORTE');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'São Camilo Santana ', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11)2972-8000' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Iguatinga 382/386 - Santo Amaro São Paulo - SP 04744-040', 'Santo Amaro', '-23.65595463737257', '-46.7055329930984', 'SUL');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue Paulista - São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 5521-4013' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Avenida Celso Garcia 4815 - Tatuapé São Paulo - SP 03085-030', 'Tatuapé', '-23.532708968779815', '-46.56652763873117', 'LESTE');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Municipal Doutor Carmino Caricchio de Tatuapé - São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 2942-8094' FROM bc
UNION ALL SELECT blood_center_id, '(11) 3394-7081' FROM bc
UNION ALL SELECT blood_center_id, '(11) 3394-6980' FROM bc
UNION ALL SELECT blood_center_id, '(11) 3394-7317' FROM bc
UNION ALL SELECT blood_center_id, '(11) 2942-8094' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Harry Dannenberg 473 - Vila Carmosina São Paulo - SP 08270-010', 'Vila Carmosina', '-23.554379709015073', '-46.46397512776769', 'LESTE');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Santa Marcelina - São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 2523-0546' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Dr. Diogo de Faria 824 - Vila Clementino São Paulo - SP 04037-002', 'Vila Clementino', '-23.595512405234825', '-46.644655093772315', 'SUL');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemocentro HSP Unifesp - São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 5576-4240' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Borges Lagoa 1450 ', 'Vila Clementino', '-23.59620470847653', '-46.65196930000301', 'SUL');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Professor Edmundo Vasconcelos ', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 5080-4435' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Pedro de Toledo 1800 - Vila Clementino São Paulo - SP 04039-000', 'Vila Clementino', '-23.597365411275334', '-46.654469818169524', 'SUL');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Iamspe - (HSPE) Banco de Sangue do Hospital do Servidor Público Estadual - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 5583-7001' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Marquês de Itu 579 - Vila Buarque São Paulo - SP 01223-001', 'Vila Buarque', '-23.54382250385755', '-46.64997768842207', 'CENTRO');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemocentro da Santa Casa de São Paulo - São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 2176-7155' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Madre Cabrine 462 2o andar Bloco D ', 'Vila Mariana', '-23.592463779956677', '-46.638739023543756', 'SUL');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Israelita Albert Einstein - Vila Mariana', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 2151-7083' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Avenida Dr. Dante Pazzanese 500 - Vila Mariana São Paulo - SP 04012-909', 'Vila Mariana', '-23.585324874667986', '-46.651334423062245', 'SUL');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Pró-Sangue - Hemocentro de São Paulo - Posto Dante Pazzanese', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '0800-55-0300' FROM bc
UNION ALL SELECT blood_center_id, '(11) 4573-7800' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Rua Dr. Alceu de Campos Rodrigues 46  - Vila Nova Conceição São Paulo - SP 04544-000', 'Vila Nova Conceição', '-23.58981837486613', '-46.6728595446497', 'SUL');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue Paulista - São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3048-8969' FROM bc
UNION ALL SELECT blood_center_id, '(11) 3048-8950' FROM bc;

INSERT INTO tb_addresses (full_address, bairro, latitude, longitude, zone)
VALUES ('Avenida Santo Amaro 2468 - Vila Olímpia São Paulo - SP 04556-100', 'Vila Olímpia', '-23.605317844976053', '-46.67599075999036', 'SUL');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemocentro São Lucas - Vila Olimpia - São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)
SELECT blood_center_id, '(11) 3660-5972' FROM bc;

-- INTERIOR

INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Joaquim Luís Vian 209 - Vila Cicma Adamantina - SP 17800-000', 'Adamantina', '-21.692189270740332', '-51.068800568424166');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'UCT Adamantina - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 3521-2500' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida da Saúde 415 Jardim - Nossa Sra. de Fatima Americana - SP 13478-640', 'Americana', '-22.742282201760016', '-47.308764315828164');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Municipal de Americana – Americana – SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3468-1739' FROM bc
UNION ALL SELECT blood_center_id, '(19) 3471-6750' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Gaspar de Lemos 2 - Alvorada Araçatuba - SP 16013-800', 'Araçatuba', '-21.228339658549217', '-50.41609216221205');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue de Araçatuba - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 3607-3935' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Rua Arthur Ferreira da Costa 330 - Aviacao Araçatuba - SP 16055-500', 'Araçatuba', '-21.19293120858644', '-50.431417305009376');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Núcleo de Hemoterapia de Araçatuba - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 2102-9400' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida da Saudade 58 - CENTRO Araraquara - SP 14801-360', 'Araçatuba', '-21.794063443303195', '-48.18141892887494');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemonúcleo Regional de Araraquara - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3301-6102' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Praça Dr. Symphronio Alves dos Santos s/n - CENTRO Assis - SP 19800-000', 'Assis', '-22.66019112552379', '-50.41011343039835');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Unidade de Coleta e Transfusão do Hospital Regional Famema - Assis - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 3302-6000' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Dr. Manoel Furtado 235 - CENTRO Batatais - SP 14300-000', 'Batatais', '-20.88857284471923', '-47.58367780258088');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Unidade de Hemoterapia - Batatais - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3761-4004' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Marcos Augusto Genovez Serra 251 - Vila Regina Bauru - SP 17012-647', 'Bauru', '-22.34241397771977', '-49.047922152609644');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemonúcleo de Bauru - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3234-4412' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Monsenhor Claro 8-88 - CENTRO Bauru - SP 17010-260', 'Bauru', '-22.329809663783866', '-49.07674360278029');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemonúcleo do Hospital de Base - Bauru - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3234-4412' FROM bc
UNION ALL SELECT blood_center_id, '(14) 3227-2942' FROM bc
UNION ALL SELECT blood_center_id, '(14) 3231-4771' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Antenor Duarte Viléla 1331 - Dr. Paulo Prata Barretos - SP 14784-400', 'Barretos', '-20.587214331915717', '-48.569211352197655');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemonúcleo - Barretos - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3321 6600' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Raul Furquim 2010 - Jardim Julia Bebedouro - SP 14706-045', 'Bebedouro', '-20.93466142321199', '-48.496487604500416');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Unidade de Hemoterapia - Bebedouro - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3342-8817' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Campus de Avenida Rubião Jr s/n Botucatu - SP 18600-400', 'Botucatu', '-22.889105446170525', '-48.49559083075703');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemocentro De Botucatu - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3811-6234' FROM bc
UNION ALL SELECT blood_center_id, '(14) 3811-6041' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida São Francisco de Assis 260 - Cidade Universitária Bragança Paulista - SP 12916-542', 'Bragança Paulista', '-22.979724704042788', '-46.534414541732176');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemonúcleo Regional USF - Hospital Universitário São Francisco de Assis - Bragança Paulista- Bragança Paulista - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 2490-1240' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Júlio de Mesquita 571 - Cambuí Campinas - SP 13010-140', 'Campinas', '-22.827843069604747', '-47.06376604381902');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'CENTRO de Hematologia e Hemoterapia - Campinas - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 2514-1555' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Carlos Chagas 480 - Cidade Universitária Campinas - SP 13083-878', 'Campinas', '-22.82879421034253', '-47.06376575564588');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemocentro da UNICAMP - Campinas - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '0800-722-8432' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Pref. Faria Lima 340 - Parque Italia Campinas - SP 13036-902', 'Campinas', '-22.916101853044157', '-47.068551283588306');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Municipal Dr. Mário Gatti - Campinas - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3272-5501' FROM bc
UNION ALL SELECT blood_center_id, '(19) 3772-5758' FROM bc
UNION ALL SELECT blood_center_id, '(19) 3772-5700' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Treze de Maio 974 - CENTRO Catanduva - SP 15800-010', 'Catanduva', '-21.139992163452614', '-48.97641541769928');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemonúcleo - Catanduva - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3522-7722' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Virgílio Pagnozi 822 - CentroDracena - SP 17900-000', 'Dracena', '-21.478587865336845', '-51.53717675836433');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'UCT Dracena - Santa Casa de Misericórdia e Maternidade de Dracena', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 3822-1716' FROM bc
UNION ALL SELECT blood_center_id, '(18) 5822-3500' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Alameda Rodrigo de Brum 1989 - Ermelino Matarazzo São Paulo - SP 03807-230', 'Ermelino Matarazzo', '-23.499774024355375', '-46.472329843727756');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Municipal Ermelino Matarazzo - São Paulo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 2545-4652' FROM bc
UNION ALL SELECT blood_center_id, '(11) 3394-8030' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua  Simão dos Santos Gomes 266 - Jardim Santista Fernandópolis - SP 15600-000', 'Fernandópolis', '-20.29486771040057', '-50.24738462170416');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Núcleo de Hemoterapia de Fernandópolis - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3442-5544' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Dr. Hélio Palermo 4181 - Recanto do Itambé Franca - SP 14409-045', 'Franca', '-20.519360863223746', '-47.394258504034504');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Núcleo de Hemoterapia de Franca - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3402 5000' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Quinto Bertoldi 40 - Vila Maia Guarujá - SP 11410-010', 'Guarujá', '-23.990754803964176', '-46.25346188368592');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue HSA - Guarujá - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(13) 3389-1515' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Mario Prandini 935 - CENTRO Itapeva - SP 18405-020', 'Itapeva', '-23.988399315893083', '-48.877634874122975');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue de Itapeva - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(15) 3522-0934' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Doná Silvéria 150 - Chácara Braz Miraglia Jaú - SP 17210-070', 'Jaú', '-22.291502995719586', '-48.55000914335151');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Amaral Carvalho - Jaú - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14)3602-1355' FROM bc
UNION ALL SELECT blood_center_id, '3602-1356' FROM bc
UNION ALL SELECT blood_center_id, '(14) 3602-1200' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Antonio Ometto 675 - Vila Claudia Limeira - SP 13480-470', 'Limeira', '-22.57939363422755', '-47.40016984182506');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue da Santa Casa - Limeira - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3446-6115' FROM bc
UNION ALL SELECT blood_center_id, '(19) 3446- 6124' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Pedro de Toledo 486 - Jardim Guanabara Lins - SP 16403-265', 'Lins', '-21.671979049868757', '-49.75523146312086');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'UCT Lins - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3533-2500' FROM bc
UNION ALL SELECT blood_center_id, '(14) 3532-5087' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Lourival Freire 240 - Fragata Marília - SP 17519-050', 'Marília', '-22.224905384742918', '-49.93795339672109');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'FAMEMA – Marília – SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3434-2541' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Barão de Jaceguai 1148 - CENTRO Mogi das Cruzes - SP 08780-906', 'Mogi das Cruzes', '-23.521526847722455', '-46.18687002133836');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Santa Casa de Mogi das Cruzes - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 4799-2892' FROM bc
UNION ALL SELECT blood_center_id, '(11) 4728-4700' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Síria 190 - CENTRO Olímpia - SP 15400-000', 'Olímpia', '-20.736527356045965', '-48.91802032697495');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Unidade de Hemoterapia de Olímpia', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3281-9080' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Joaquim de Azevedo 604 - Vila Moraes Ourinhos - SP 19900-280', 'Ourinhos', '-22.98485168888676', '-49.86500547985864');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue - Ourinhos - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3302-2245' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Silva Jardim 1700 - Alto Piracicaba - SP 13419-140 (Antigo prédio do ‘Saúde Inteligente’ dentro do complexo da Santa Casa)', 'Piracicaba', '-22.73613701916124', '-47.64196761610465');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemonúcleo de Piracicaba - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3422-2019' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida da Saudade 1299 Pirangi - SP 15820-000', 'Pirangi', '-21.089082251043095', '-48.66126672786286');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Laboratório Hemopacli - Pirangi - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3386-1770' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Cel. José Soares Marcondes 2063 - Uep1-S.1 Pres. Prudente - SP 19010-089', 'Presidente Prudente', '-22.12896941003021', '-51.3916658583481');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Instituto Rh Hematologia e Hemoterapia - Presidente Prudente - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 3226-1555' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Wenceslau Braz 5 - Vila Euclides Pres. Prudente - SP 19014-030', 'Presidente Prudente', '-22.12947180726716', '-51.392401374910314');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Núcleo de Hemoterapia de Presidente Prudente - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(18) 3223-3511' FROM bc
UNION ALL SELECT blood_center_id, '(18) 3223-4490' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Quintino Bocaiuva 470 - CENTRO Ribeirão Preto - SP 14015-160', 'Ribeirão Preto', '-21.186574109177347', '-47.80806224653398');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue - Ribeirão Preto - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3610-8929' FROM bc
UNION ALL SELECT blood_center_id, '(16) 3610-5822' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Tenente Catão Roxo 2501 - Vila Monte Alegre Ribeirão Preto - SP 14051-140', 'Ribeirão Preto', '-21.160318928566696', '-47.848559714005695');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'HEMOCENTRO RP – Ribeirão Preto (Campus USP) – SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 2101-9352' FROM bc
UNION ALL SELECT blood_center_id, '0800-979-6049' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Quintino Bocaiuva 975 - Vila Seixas Ribeirão Preto - SP 14015-160', 'Ribeirão Preto', '-21.18936151510267', '-47.804153305214896');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'GSH Banco de Sangue de Ribeirão Preto - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3610-1515' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Altíno Arantes 656 - Jardim Sumare Ribeirão Preto - SP 14025-120', 'Ribeirão Preto', '-21.186188106827093', '-47.81473097119368');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemac - Ribeirão Preto - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 99267-6541' FROM bc
UNION ALL SELECT blood_center_id, '(16) 3610-1211' FROM bc
UNION ALL SELECT blood_center_id, '(16) 2138-3298' FROM bc
UNION ALL SELECT blood_center_id, '(16) 2138-3004' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Dois 297 - CENTRO Rio Claro - SP 13500-330', 'Rio Claro', '-22.415416252124498', '-47.5567940550812');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de sangue da Santa Casa de Misericórdia - Rio Claro - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3535-7022' FROM bc
UNION ALL SELECT blood_center_id, '(19) 3535-7000' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Paulino Botelho de Abreu Sampaio 535 - Jardim Pureza São Carlos - SP 13561-060', 'São Carlos', '-22.01196744261255', '-47.901116100176814');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Santa Casa - São Carlos - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3509-1100' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida João Osório 701 - CENTRO São João da Boa Vista - SP 13870-251', 'São João da Boa Vista', '-21.9821585441285', '-46.79584175209147');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Bioclínica Banco de Sangue - São João da Boa Vista - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3633-7036' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Jamil Feres Kfouri 80 - Jardim Panorama São José do Rio Preto - SP 15091-240', 'São José do Rio Preto', '-20.827110447106094', '-49.40010608702224');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemocentro - São José do Rio Preto - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3201-5151' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Luíz Vaz de Camões 3150 - Vila Redentora São José do Rio Preto - SP 15015-750', 'São José do Rio Preto', '-20.82179739839853', '-49.390010276934014');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Beneficência Portuguesa de São José do Rio Preto - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3211-5454' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Antônio Saes 425 - CENTRO São José dos Campos - SP 12210-040', 'São José do Rio Preto', '-23.187053402994582', '-45.88174780232667');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Serviço de Hematologia e Hemoterapia de São José dos Campos - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(12) 3519-3766' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Dr. Cláudio Luiz da Costa 50 - Jabaquara - Santos - SP 11075-101', 'Santos', '-23.945567652357543', '-46.33671885483469');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue da Santa Casa - Santos - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(13) 3202-0600' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Pedro Américo 60 - Campo Grande Santos - SP 11075-400', 'Santos', '-23.956996956639212', '-46.333782486629836');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue do Hospital Ana Costa - Santos - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(13) 3226-9252' FROM bc
UNION ALL SELECT blood_center_id, '(13) 3228-9000' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Dr. Armando Salles de Oliveira 138 - Boqueirão Santos - SP 11050-070', 'Santos', '-23.962554349551326', '-46.3251979374293');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Casa de Saúde - Santos - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(13) 3202-7900' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Oswaldo Cruz 197 - Boqueirão - Santos - SP 11045-101', 'Santos', '-23.96140243503292', '-46.321063397426066');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'COLSAN - Santos - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(13) 3223-2860' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Epitácio Pessoa 1401 - CENTRO Sertãozinho - SP 14160-180', 'Sertãozinho', '-21.136252689706666', '-47.99332486763295');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue de Sertãozinho - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(16) 3942-3404' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Comendador Pereira Inácio 564 - Jardim Vergueiro Sorocaba - SP 18030-005', 'Sorocaba', '-23.510516913126096', '-47.45684417428096');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'COLSAN - Sorocaba - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(15) 3224-2930' FROM bc
UNION ALL SELECT blood_center_id, '(15) 3332-9461' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida da Amizade 2400 - Jardim Bela Vista Sumaré - SP 13175-490', 'Sumaré', '-22.8166388785474', '-47.24170615558801');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Estadual - Sumaré - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(19) 3883-8909' FROM bc
UNION ALL SELECT blood_center_id, '(19) 3883-8900' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Ibirama 1214 - Jardim Sao Judas Tadeu Taboão da Serra - SP 06785-300', 'Taboão da Serra', '-23.640469997941512', '-46.80987265181835');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital Geral de Pirajussara - Taboão da Serra - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 3583-9400' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Inglaterra 190 - Jardim das Nações Taubaté - SP 12030-450', 'Taubaté', '-23.031189538132285', '-45.57075078698826');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Núcleo de Hemoterapia - Taubaté - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(12) 3624 1273' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Manoel Ferreira Damião 444 - Vila Santa Terezinha Tupã - SP 17625-005', 'Tupã', '-21.924505684409784', '-50.518353834927844');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'UCT Tupã - Santa Casa da Misericórdia - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(14) 3496-1022' FROM bc
UNION ALL SELECT blood_center_id, '(14) 3496-1177' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Antônio Galera Lopes 2652 - Pozzobon Votuporanga - SP 15503-024', 'Votuporanga', '-20.400049828139053', '-49.97194343101954');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemocentro de Votuporanga - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3423-2986' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida da Saudade 2603 - Cidade Nova Votuporanga - SP 15501-405', 'Votuporanga', '-20.426936027093895', '-49.98144092776928');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Unidade de Coleta de Votuporanga - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(17) 3423-2986' FROM bc
;


-- METROPOLE

INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Ângela Mirella 354 - Jardim Barueri Barueri - SP 06411-330', 'Barueri', '-23.496594373423395', '-46.872630644112455');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Pró-Sangue - Barueri - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '0800 55 0300' FROM bc
UNION ALL SELECT blood_center_id, '(11) 4573-7800' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Estrada de Itapecerica 1661 - Vila Maracana - São Paulo - SP 05835-005', 'Campo Limpo', '-23.648855830323726', '-46.74883573293573');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'COLSAN - Campo Limpo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 5812-1379' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Henry Borden s/n - Vila Santa Rosa Cubatão - SP 11515-000', 'Cubatão', '-23.890345918677657', '-46.42097890782506');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hospital de Cubatão - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(13) 3388 4887' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua José Bonifácio 1641 - Serraria Diadema - SP 09960-120', 'Diadema', '-23.706485270609843', '-46.60931470246659');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue do Hospital Estadual - Diadema - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 3583-1400' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Maria Cândida Pereira 568 - Vila Itapegica Guarulhos - SP 07041-020', 'Guarulhos', '-23.478666929205342', '-46.5515210012654');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemocentro Guarulhos Hospital Stella Maris - Guarulhos - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 2423-8551' FROM bc
UNION ALL SELECT blood_center_id, '(11) 2423-8500' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua  Santo Antônio 95 - CENTRO Guarulhos - SP 07110-110', 'Guarulhos', '-23.467639015379756', '-46.52487354465165');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemocentro São Lucas - Guarulhos - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 3660-6040' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua  Anchieta 66 - Vila Boaventura Jundiaí - SP 17490-050', 'Jundiaí', '-23.18673139621514', '-46.888193840200884');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Bioclínica Análises Clínicas - Jundiaí - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 4586-3600' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua XV de Novembro 1848 - Vila Mun.Jundiaí - SP 13201-305', 'Jundiaí', '-23.180560443775427', '-46.88415388972932');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'COLSAN – Jundiaí – SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 4521-4025' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Dr. Henrique Calderazzo 321 - Paraíso - Santo André - SP 09190-615', 'Santo André', '-23.67063338208694', '-46.53301534649501');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Banco de Sangue Hospital Mário Covas - Santo André - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 2829-5162' FROM bc
UNION ALL SELECT blood_center_id, '(11) 2829-5144' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida dos Andradas 444 - Vila Santa Teresa Santo André - SP 09030-350', 'Santo André', '-23.66883458318443', '-46.52753158486126');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemocentro São Lucas - Santo André - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 3660-5994' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Pedro Jacobucci 440 - Jardim das AmericasSão Bernardo do Campo - SP 09725-750', 'São Bernardo do Campo', '-23.698708951024127', '-46.555513588824205');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'COLSAN - São Bernado do Campo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 4332-3900' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Mediterrâneo 470 - Jardim do Mar São Bernardo do Campo - SP 09750-420', 'São Bernardo do Campo', '-23.69120807867155', '-46.55410337422158');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemocentro São Lucas - São Bernardo do Campo - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 3660-5968' FROM bc
UNION ALL SELECT blood_center_id, '(11) 3660-6000' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua  Peri 361 - Santa Paula São Caetano do Sul - SP 09540-290', 'São Caetano do Sul', '-23.624740921365976', '-46.56447583300151');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'COLSAN - São Caetano do Sul - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 4227-1083' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Avenida Antônio Marques Figueira s/n - Vila Figueira Suzano - SP 08676-000', 'Suzano', '-23.539220562153158', '-46.30630002824804');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Hemocentro Suzano - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '(11) 4752-9999' FROM bc
UNION ALL SELECT blood_center_id, '(11) 94442-7993' FROM bc
;
INSERT INTO tb_addresses (full_address, municipio, latitude, longitude)
VALUES ('Rua Ari Barroso 355 - Pres. Altino Osasco - SP 06216-240', 'Osasco', '-23.524979141410473', '-46.77166704039158');

WITH bc AS (
    INSERT INTO tb_blood_centers (blood_center_id, name, address_id)
    VALUES (gen_random_uuid(), 'Pró-Sangue - Osasco - SP', currval('tb_addresses_address_id_seq'))
    RETURNING blood_center_id
)
INSERT INTO tb_blood_center_phone (blood_center_id, phone)

SELECT blood_center_id, '0800-55-0300' FROM bc
UNION ALL SELECT blood_center_id, '(11) 4573-7800' FROM bc
;
