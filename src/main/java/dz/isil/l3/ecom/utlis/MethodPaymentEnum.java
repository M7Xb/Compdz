package dz.isil.l3.ecom.utlis;

import lombok.Getter;

@Getter
public enum MethodPaymentEnum {

    PAIEMENT_A_RECEPTION(1, "Paiement à réception"),
    BARIDI_MOB(2, "Baridi Mob"),
    VISA_CARD(3, "Visa card");

    private final int id;
    private final String libelle;

    MethodPaymentEnum(int id, String libelle) {
        this.id = id;
        this.libelle = libelle;
    }
}
