package dz.isil.l3.ecom.entity;

import lombok.Data;
import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name= "DEALS")
public class DealProduct {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Lob
    @Column(name="image", columnDefinition="MEDIUMBLOB") // Adjust the column definition
    private byte[] image;

    private String description;
    private Double oldPrice;
    private Double newPrice;
    private LocalDateTime endTime;

}

