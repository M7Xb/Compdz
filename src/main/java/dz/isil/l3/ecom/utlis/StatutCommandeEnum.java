package dz.isil.l3.ecom.utlis;

import lombok.Data;
import lombok.Getter;

@Getter
public enum StatutCommandeEnum {

    INCONNU(0, "refuser"),
    EN_ATTENTE_VALIDATION(1, "En-attente"),
    VALIDEE(2, "Validée");
//    EN_COURS_DE_PREPARATION(3, "En cours de livraison"),
//    PREPAREE(3, "Préparé"),
//    EN_COURS_DE_LIVRAISON(2, "En cours de livraison"),
//    LIVREE(5, "Livrée");

    private final int id;
    private final String libelle;

    StatutCommandeEnum(int id, String libelle) {
        this.id = id;
        this.libelle = libelle;
    }

    public static StatutCommandeEnum getById(int id) {
        for (StatutCommandeEnum status : values()) {
            if (status.getId() == id) {
                return status;
            }
        }
        return StatutCommandeEnum.INCONNU;
    }
}
