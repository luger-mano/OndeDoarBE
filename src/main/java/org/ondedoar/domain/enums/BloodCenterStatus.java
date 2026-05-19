package org.ondedoar.domain.enums;

import lombok.Getter;

@Getter
public enum BloodCenterStatus {
    ABERTO("Unidade aberta"),
    FECHADO("Unidade fechada"),
    VERIFICAR_NO_SITE_OU_LIGANDO("Ligar ou acessar o site para conferir");


    private final String situation;

    BloodCenterStatus(String situation) {
        this.situation = situation;
    }
}
