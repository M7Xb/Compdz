package dz.isil.l3.ecom.formulaire;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ItemForm {
    private String id;
    private String name;
    private double price;
    private int quantity;
    private String image;
}
