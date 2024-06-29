package dz.isil.l3.ecom.entity;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name= "COMMENTS")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    private String career;

    // Getters and setters
}

