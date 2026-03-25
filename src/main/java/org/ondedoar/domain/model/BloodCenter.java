package org.ondedoar.domain.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;
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

    @Column(name = "phone")
    private String phone;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Address address;

    @Column(name = "operation")
    private LocalTime operation;

    @Column(name = "blood_stock")
    private Double bloodStock;

    public BloodCenter() {
    }

    public BloodCenter(UUID bloodCenterId, String name, String phone, Address address, LocalTime operation, Double bloodStock) {
        this.bloodCenterId = bloodCenterId;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.operation = operation;
        this.bloodStock = bloodStock;
    }
}
