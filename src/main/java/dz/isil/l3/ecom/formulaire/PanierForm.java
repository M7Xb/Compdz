package dz.isil.l3.ecom.formulaire;

import lombok.*;

import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PanierForm {

    private List<ItemForm> items;

    public void addItem(ItemForm itemForm) {
        if(this.items == null) {
            items = new ArrayList<>();
        }
        this.items.add(itemForm);
    }
}
