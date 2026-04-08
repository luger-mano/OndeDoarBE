package org.ondedoar.adapter.request.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserCoordinatesRequestDto {
    private String cep;
    private String logradouro;
    private String localidade;

    public UserCoordinatesRequestDto(String logradouro, String localidade, String cep) {
        this.logradouro = logradouro;
        this.localidade = localidade;
        this.cep = cep;
    }
}
