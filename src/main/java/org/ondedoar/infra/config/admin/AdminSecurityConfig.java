package org.ondedoar.infra.config.admin;

import jakarta.transaction.Transactional;
import org.ondedoar.domain.model.Role;
import org.ondedoar.domain.model.User;
import org.ondedoar.domain.repository.RoleRepository;
import org.ondedoar.domain.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDate;
import java.time.Month;
import java.util.Set;

@Configuration
public class AdminSecurityConfig implements CommandLineRunner {

    private final RoleRepository roleRepository;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public AdminSecurityConfig(RoleRepository roleRepository, UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.roleRepository = roleRepository;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        Role roleAdm = roleRepository.findByName(Role.Values.SUPER_ADMIN.name())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Role Not Found"));

        var userAdm = userRepository.findByFullName("adm");

        userAdm.ifPresentOrElse(
                user -> {
                },
                () -> {
                    User adm = new User();

                    adm.setFullName("adm");
                    adm.setMail("adm@ondedoar.com");
                    adm.setPhone("1234567890");
                    adm.setDateBirth(LocalDate.of(2000, Month.MAY, 20));
                    adm.setPassword(passwordEncoder.encode("doarSalvaVidas14"));
                    adm.setRoles(Set.of(roleAdm));

                    userRepository.save(adm);
                }
        );

    }
}
