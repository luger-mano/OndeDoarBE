package org.ondedoar.domain.service.idempotency;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.ondedoar.domain.model.IdempotencyKey;
import org.ondedoar.domain.repository.IdempotencyKeyRepository;
import org.ondedoar.infra.exceptions.GlobalExceptionHandler;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class IdempotencyKeyServiceImpl implements IdempotencyKeyService {

    private final IdempotencyKeyRepository idempotencyKeyRepository;

    @Override
    public Map<String, String> getIdempotencyKey(String key) {
        log.info("Finding an IdempotencyKey");
        Optional<IdempotencyKey> idempotencyOpp = idempotencyKeyRepository.findByIdempotencyKey(key);

        return idempotencyOpp.map(idempotencyKey -> Map.of(
                "userId", idempotencyKey.getUserId(),
                "message", "User request received",
                "status", "processed",
                "key", idempotencyKey.getIdempotencyKey()
        )).orElseGet(() -> Map.of(
                "userId", "Null",
                "message", "user request received",
                "status", "processed"
        ));
    }

    @Override
    @Transactional
    public IdempotencyKey createIdempotencyKeyByKeyAndUserId(String key, String userId) {
        try {
            log.info("Creating an IdempotencyKey object");
            IdempotencyKey idempotencyKey;

            idempotencyKey = new IdempotencyKey();
            idempotencyKey.setIdempotencyKey(key);
            idempotencyKey.setUserId(userId);

            log.info("Idempotency key saved");
            return idempotencyKeyRepository.save(idempotencyKey);

        } catch (GlobalExceptionHandler e) {
            log.error("Failed to create an IdempotencyKey object in the database", e.getCause());
            throw new RuntimeException(e);
        }
    }
}
