package org.ondedoar.infra.api.viacep;

import org.ondedoar.domain.model.Address;

public interface ViaCepService {
    Address searchByCep(String cep);
}
