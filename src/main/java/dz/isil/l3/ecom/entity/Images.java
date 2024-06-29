package dz.isil.l3.ecom.entity;

import lombok.Data;
import javax.persistence.*;
import java.util.Base64;

@Data
@Entity
@Table(name= "IMAGES")
public class Images {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Lob
    private byte[] image;

    // Add a method to get the image as a Base64 encoded string
//    public String getImageAsBase64() {
//        return Base64.getEncoder().encodeToString(this.image);
//    }
}


