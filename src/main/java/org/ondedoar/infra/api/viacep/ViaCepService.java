package org.ondedoar.infra.api.viacep;

import org.ondedoar.domain.model.bloodcenter.BloodCenterAddress;

public interface ViaCepService {
    BloodCenterAddress searchByCep(String cep);
}
