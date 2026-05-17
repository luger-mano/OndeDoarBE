package org.ondedoar.domain.repository;

import jakarta.validation.constraints.NotBlank;
import org.ondedoar.domain.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface UserRepository extends JpaRepository<User, UUID> {
    boolean existsByMail(String mail);

    Optional<User> findByMail(String mail);

    Optional<User> findByUserName(String adm);

    boolean existsByPhone(@NotBlank(message = "Campo 'phone' deve ser preenchido") String phone);
}
