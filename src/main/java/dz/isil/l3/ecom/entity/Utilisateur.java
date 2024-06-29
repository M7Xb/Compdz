package dz.isil.l3.ecom.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.util.Date;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity // Annotation pour indiquer que cette classe est une entité JPA
@Table(name= "UTILISATION")
public class Utilisateur {

    @Id // Annotation pour spécifier que cet attribut est l'identifiant de l'entité
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long idUser;

    private String login;

    private String nom;

    private String prenom;

    private String encriptedPassword;

    private Date dateInscription;

    private String adress;

    private String mail;

    private String validationToken;

    private boolean valide;

    private String role;

}
