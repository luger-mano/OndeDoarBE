package org.ondedoar.domain.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

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
    @JoinColumn(name = "blood_center_address_id")
    private BloodCenterAddress bloodCenterAddress;

    @Column(name = "operation")
    private String operation;

    public BloodCenter() {
    }

    public BloodCenter(UUID bloodCenterId, String name, List<String> phone, BloodCenterAddress bloodCenterAddress, String operation) {
        this.bloodCenterId = bloodCenterId;
        this.name = name;
        this.phone = phone;
        this.bloodCenterAddress = bloodCenterAddress;
        this.operation = operation;
    }
}
