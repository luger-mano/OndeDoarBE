package org.ondedoar.domain.repository;

import org.ondedoar.domain.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface UserRepository extends JpaRepository<User, UUID> {
    boolean existsByMail(String mail);

    Optional<User> findByMail(String mail);
}
