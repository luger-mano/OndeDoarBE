package org.ondedoar.infra.config.generator;

public class CsvConfiguration {

//    @Override
//    public void run(String... args) throws Exception {
//
//        Files.lines(Path.of("src/main/resources/csv/sp_metropole.csv"), StandardCharsets.UTF_8)
//                .forEach(line -> {
//
//                    String[] parts = line.split(",");
//
//                    if (parts.length < 5) return;
//
//                    String name = Normalizer.normalize(parts[0], Normalizer.Form.NFC);
//                    String municipio = Normalizer.normalize(parts[1], Normalizer.Form.NFC);
//                    String phone = Normalizer.normalize(parts[2], Normalizer.Form.NFC);
//                    String address = Normalizer.normalize(parts[3], Normalizer.Form.NFC);
//
//                    String lat = null;
//                    String lon = null;
//
//                    if (parts[4] != null) {
//                        String cleaned = parts[4].replace("@", "").trim();
//                        String[] coords = cleaned.split(" ");
//
//                        if (coords.length >= 2) {
//                            lat = coords[0];
//                            lon = coords[1];
//                        }
//                    }
//
//                    name = name.replace("'", "''");
//                    municipio = municipio.replace("'", "''");
//                    address = address.replace("'", "''");
//
//                    String[] phones = phone.split("/");
//
//                    System.out.printf("""
//                                    INSERT INTO address (full_address, municipio, latitude, longitude)
//                                    VALUES ('%s', '%s', '%s', '%s');
//
//                                    WITH bc AS (
//                                        INSERT INTO blood_center (blood_center_id, name, address_id)
//                                        VALUES (gen_random_uuid(), '%s', currval('address_address_id_seq'))
//                                        RETURNING blood_center_id
//                                    )
//                                    INSERT INTO blood_center_phone (blood_center_id, phone)
//
//                                    """,
//                            address,
//                            municipio,
//                            lat,
//                            lon,
//                            name
//                    );
//
//                    for (int i = 0; i < phones.length; i++) {
//                        String p = phones[i].trim().replace("'", "''");
//
//                        if (i == 0) {
//                            System.out.printf("SELECT blood_center_id, '%s' FROM bc%n", p);
//                        } else {
//                            System.out.printf("UNION ALL SELECT blood_center_id, '%s' FROM bc%n", p);
//                        }
//                    }
//
//                    System.out.println(";");
//                });
//    }
}
