package org.ondedoar.domain.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.PastOrPresent;
import lombok.Getter;
import lombok.Setter;
import org.ondedoar.domain.enums.BloodType;

import java.time.LocalDate;
import java.util.UUID;

@Entity
@Table(name = "TB_USERS")
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "user_id")
    private UUID userId;

    @Column(name = "full_name", nullable = false, length = 40)
    private String fullName;

    @Column(name = "phone", nullable = false, length = 11)
    private String phone;

    @Column(name = "mail", unique = true)
    private String mail;

    @Column(name = "password", nullable = false, length = 20)
    private String password;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Address address;

    @Column(name = "date_birth", nullable = false)
    private LocalDate dateBirth;

    @Column(name = "blood_type")
    @Enumerated(EnumType.STRING)
    private BloodType bloodType;

    @PastOrPresent
    @Column(name = "last_donation")
    private LocalDate lastDonation;

    @Column(name = "active")
    private Boolean active;

    public User() {
    }

    public User(UUID userId, String fullName, String phone, String mail, String password, LocalDate dateBirth, BloodType bloodType, LocalDate lastDonation, Boolean active) {
        this.userId = userId;
        this.fullName = fullName;
        this.phone = phone;
        this.mail = mail;
        this.password = password;
        this.dateBirth = dateBirth;
        this.bloodType = bloodType;
        this.lastDonation = lastDonation;
        this.active = active;
    }
}
