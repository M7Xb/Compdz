package dz.isil.l3.ecom.formulaire;

import dz.isil.l3.ecom.utlis.MethodPaymentEnum;
import lombok.Data;

@Data
public class InfoCommandeForm {

    private String nom;
    private String prenom;
    private String email;
    private String wilaya;
    private String codePostal;
    private String adress;
    private String price;
    private MethodPaymentEnum methodPayment;
}
