package dz.isil.l3.ecom.formulaire;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UtilisateurForm {

    private String name;
    private  String prenom;
    private String adresse;
    private String email;
    private String password;
    private String reapetPassword;
}
