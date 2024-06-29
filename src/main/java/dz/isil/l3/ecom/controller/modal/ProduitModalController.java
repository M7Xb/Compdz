package dz.isil.l3.ecom.controller.modal;

import dz.isil.l3.ecom.entity.Produit;
import dz.isil.l3.ecom.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ProduitModalController {

    public final ProduitService produitServ;

    @Autowired
    public ProduitModalController(ProduitService produitServ) {
        this.produitServ = produitServ;
    }


    @GetMapping("/produit/image/{id}")
    public ResponseEntity<byte[]> getImage(@PathVariable int id) {
        Produit produit = produitServ.getProduitById(id);
        if (produit != null && produit.getImage() != null) {
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_JPEG) // ou MediaType.IMAGE_PNG selon le type d'image
                    .body(produit.getImage());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

}
