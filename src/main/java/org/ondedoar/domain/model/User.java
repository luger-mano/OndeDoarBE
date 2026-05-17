package org.ondedoar.domain.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.PastOrPresent;
import lombok.Getter;
import lombok.Setter;
import org.ondedoar.adapter.request.security.LoginRequestDto;
import org.ondedoar.domain.enums.BloodType;
import org.ondedoar.domain.enums.BrazilianState;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDate;
import java.util.Set;
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

    @Column(name = "user_name", nullable = false, length = 40)
    private String userName;

    @Column(name = "middleName", nullable = false, length = 40)
    private String middleName;

    @Column(name = "phone", nullable = false, length = 11, unique = true)
    private String phone;

    @Column(name = "mail", unique = true)
    private String mail;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "date_birth")
    private LocalDate dateBirth;

    @Column(name = "blood_type")
    @Enumerated(EnumType.STRING)
    private BloodType bloodType;

    @Column(name = "brazilian_state")
    @Enumerated(EnumType.STRING)
    private BrazilianState state;

    @PastOrPresent
    @Column(name = "last_donation")
    private LocalDate lastDonation;

    @Column(name = "active")
    private Boolean active;

    @ManyToMany(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinTable(
            name = "tb_user_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    private Set<Role> roles;

    public User() {
    }

    public User(UUID userId, String userName, String middleName, String phone, String mail, String password, LocalDate dateBirth, BloodType bloodType, BrazilianState state, LocalDate lastDonation, Boolean active, Set<Role> roles) {
        this.userId = userId;
        this.userName = userName;
        this.middleName = middleName;
        this.phone = phone;
        this.mail = mail;
        this.password = password;
        this.dateBirth = dateBirth;
        this.bloodType = bloodType;
        this.state = state;
        this.lastDonation = lastDonation;
        this.active = active;
        this.roles = roles;
    }

    public Boolean isLoginCorrect(LoginRequestDto requestDto, PasswordEncoder passwordEncoder){
        return passwordEncoder.matches(requestDto.getPassword(), this.password);
    }
}
