package dz.isil.l3.ecom.entity;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name= "ADS")
public class Ads {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String description;

}
