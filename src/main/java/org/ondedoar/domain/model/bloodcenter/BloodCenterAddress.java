package org.ondedoar.domain.model.bloodcenter;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.ondedoar.domain.enums.Zone;

@Entity
@Table(name = "tb_blood_center_addresses")
@Getter
@Setter
public class BloodCenterAddress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "blood_center_address_id")
    private Long bloodCenterAddressId;

    @Column(name = "full_address")
    private String fullAddress;

    @Column(name = "cep")
    private String cep;

    @Column(name = "bairro")
    private String bairro;

    @Column(name = "uf")
    private String uf;

    @Column(name = "estado")
    private String estado;

    @Column(name = "latitude")
    private String latitude;

    @Column(name = "longitude")
    private String longitude;

    @Enumerated(EnumType.STRING)
    @Column(name = "zone")
    private Zone zone;

    @Column(name = "municipio")
    private String municipio;

    private String logradouro;
    private String complemento;
    private String unidade;
    private String localidade;
    private String regiao;
    private String ibge;
    private String gia;
    private String siafi;

    public BloodCenterAddress() {
    }

    public BloodCenterAddress(Long bloodCenterAddressId, String fullAddress, String cep, String bairro, String uf, String estado, String latitude, String longitude, Zone zone, String municipio, String logradouro, String complemento, String unidade, String localidade, String regiao, String ibge, String gia, String siafi) {
        this.bloodCenterAddressId = bloodCenterAddressId;
        this.fullAddress = fullAddress;
        this.cep = cep;
        this.bairro = bairro;
        this.uf = uf;
        this.estado = estado;
        this.latitude = latitude;
        this.longitude = longitude;
        this.zone = zone;
        this.municipio = municipio;
        this.logradouro = logradouro;
        this.complemento = complemento;
        this.unidade = unidade;
        this.localidade = localidade;
        this.regiao = regiao;
        this.ibge = ibge;
        this.gia = gia;
        this.siafi = siafi;
    }
}
