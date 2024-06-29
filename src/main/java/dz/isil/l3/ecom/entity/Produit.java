package dz.isil.l3.ecom.entity;

//import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;


@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity // Annotation pour indiquer que cette classe est une entité JPA
@Table(name= "PRODUIT")
public class Produit {
    @Id // Annotation pour spécifier que cet attribut est l'identifiant de l'entité
    @GeneratedValue(strategy = GenerationType.SEQUENCE) // Annotation pour générer automatiquement la valeur de l'identifiant
    private int id;

    private String name;

    private double prix;

    private int quantiteStock;

    @Lob
    private byte[] image;

    private String description;

    @ManyToOne
    private Category category;

}



