package org.ondedoar.domain.service.idempotency;

import org.ondedoar.domain.model.IdempotencyKey;

import java.util.Map;


public interface IdempotencyKeyService {

    Map<String, String> getIdempotencyKey(String key);

    IdempotencyKey createIdempotencyKeyByKeyAndUserId(String key, String consentId);
}
