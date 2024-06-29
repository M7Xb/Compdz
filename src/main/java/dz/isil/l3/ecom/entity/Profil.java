package dz.isil.l3.ecom.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity // Annotation pour indiquer que cette classe est une entité JPA
@Table(name= "PROFIL")
public class Profil
{
    @Id // Annotation pour spécifier que cet attribut est l'identifiant de l'entité
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int idProfil;

    private String labelle;

}
