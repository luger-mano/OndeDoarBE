package org.ondedoar.domain.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "TB_BLOOD_CENTERS")
@Getter
@Setter
public class BloodCenter {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "blood_center_id")
    private UUID bloodCenterId;

    @Column(name = "name")
    private String name;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(
            name = "tb_blood_center_phone",
            joinColumns = @JoinColumn(name = "blood_center_id")
    )
    @Column(name = "phone")
    private List<String> phone;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "address_id")
    private Address address;

    @Column(name = "operation")
    private LocalTime operation;

    @Column(name = "blood_stock")
    private Double bloodStock;

    public BloodCenter() {
    }

    public BloodCenter(UUID bloodCenterId, String name, List<String> phone, Address address, LocalTime operation, Double bloodStock) {
        this.bloodCenterId = bloodCenterId;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.operation = operation;
        this.bloodStock = bloodStock;
    }
}
