package dz.isil.l3.ecom.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "CMD_ARTICLE")
public class CommandeArticle {

    @Id // Annotation pour spécifier que cet attribut est l'identifiant de l'entité
    @GeneratedValue(strategy = GenerationType.SEQUENCE) // Annotation pour générer automatiquement la valeur de l'identifiant
    private Long id;

    private int quantite;

    private int produitId;
}
