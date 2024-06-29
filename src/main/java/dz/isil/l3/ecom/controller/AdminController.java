package dz.isil.l3.ecom.controller;

import dz.isil.l3.ecom.entity.Produit;
import dz.isil.l3.ecom.service.ProduitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    public final ProduitService produitServ;

    @Autowired
    public AdminController(ProduitService produitServ) {
        this.produitServ = produitServ;
    }

    @GetMapping("/getAllProduits")
    public String getAllProduit(Model model) {
        List<Produit> mesProduits = produitServ.getAllProduits();

        model.addAttribute("ProduitBoucle", mesProduits);

        return "admin/afficheProduit";
    }

    @GetMapping("/getProduits/{name}")
    public List<Produit> getSearchProduits(@PathVariable("name") String nomProduit) {
        List<Produit> mesProduits = produitServ.getProduitByName(nomProduit);

        return mesProduits;
    }



    @PostMapping(value = "/addProduit", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
    public Produit ajouterCathalogBoissons(@RequestBody Produit produit) {
        return produitServ.ajouterProduit(produit);
    }

}
