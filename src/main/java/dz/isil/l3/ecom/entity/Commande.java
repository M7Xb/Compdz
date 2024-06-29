package dz.isil.l3.ecom.entity;


import dz.isil.l3.ecom.utlis.StatutCommandeEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;
import java.util.List;


@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity // Annotation pour indiquer que cette classe est une entité JPA
@Table(name= "COMMANDE")
public class Commande {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Génère automatiquement la valeur de l'identifiant
    private Long idCommande;

    private Long idUtilisateur;

    private Date dateCreation;

    private Date dateValidation;

    private int statut;

    @OneToMany(cascade = CascadeType.ALL)
    private List<CommandeArticle> articles;

    // Ce champ n'est pas récupérer de la bdd directement mais sera alimenté en fonction de la liste des articles
    @Transient
    private List<Produit> produits;

    // Informations de livraison
    private String nom;
    private String prenom;
    private String email;
    private String wilaya;
    private String codePostal;
    private String adress;
    private String price;
    private int methodPayment;

    public String getLibelleStatut() {
        return StatutCommandeEnum.getById(this.statut).getLibelle();
    }

}
