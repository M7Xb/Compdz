package dz.isil.l3.ecom.entity;
//import jakarta.persistence.*;

import javax.persistence.*;

@Entity
@Table(name = "quantites") // Spécifie le nom de la table dans la base de données
public class Quantite {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idQuant;


    public Quantite() {}

    // Constructeur
    public Quantite(Long idQuant) {
        this.idQuant = idQuant;
    }

    // Getters et setters pour idQuant
    public Long getIdQuant() {
        return idQuant;
    }

    public void setIdQuant(Long idQuant) {
        this.idQuant = idQuant;
    }
}
