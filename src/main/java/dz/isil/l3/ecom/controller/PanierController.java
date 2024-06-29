package dz.isil.l3.ecom.controller;

import dz.isil.l3.ecom.entity.Article;
import dz.isil.l3.ecom.entity.Panier;
import dz.isil.l3.ecom.entity.Produit;
import dz.isil.l3.ecom.formulaire.ItemForm;
import dz.isil.l3.ecom.formulaire.PanierForm;
import dz.isil.l3.ecom.service.PanierService;
import dz.isil.l3.ecom.service.ProduitService;
import dz.isil.l3.ecom.utlis.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.NoSuchElementException;

@RestController
public class PanierController {

    private final PanierService panierService;
    public final ProduitService produitService;

    @Autowired
    public PanierController(PanierService panierService, ProduitService produitService) {
        this.panierService = panierService;
        this.produitService = produitService;
    }

    @PostMapping("/panier/item/add")
    public String ajouterArticle(@RequestBody Long articleId, HttpSession session) {
        Long idConnectedUser = UserUtils.findConnectedUserId();
        if (idConnectedUser == null) {
            return "User not logged in";
        }

        panierService.ajouterArticle(articleId, idConnectedUser);
        return "Article added to cart";
    }

    @DeleteMapping("/panier/item/remove")
    public String supprimerArticle(@RequestBody Long articleId, HttpSession session) {
        Long idConnectedUser = UserUtils.findConnectedUserId();
        if (idConnectedUser == null) {
            return "User not logged in";
        }

        panierService.SupprimerArticle(articleId, idConnectedUser);
        return "Article removed from cart";
    }

    @GetMapping("/panier/items")
    public List<ItemForm> getPanier() {
        Long idConnectedUser = UserUtils.findConnectedUserId();
        if (idConnectedUser == null) {
            return null;
        }

        Panier panier = panierService.getPanier(idConnectedUser);
        PanierForm panierForm = transformPanierToPanierForm(panier);

        return panierForm.getItems();
    }

    private PanierForm transformPanierToPanierForm(Panier panier) {
        if (panier == null) {
            return null;
        }
        PanierForm panierForm = new PanierForm();
        for (Article article : panier.getArticles()) {
            ItemForm itemForm = transformArticleToItemForm(article);
            if (itemForm != null) {
                panierForm.addItem(itemForm);
            }
        }
        return panierForm;
    }

    private ItemForm transformArticleToItemForm(Article article) {
        if (article == null) {
            return null;
        }
        ItemForm itemForm = new ItemForm();
        try {
            Produit produit = produitService.getProduitById(article.getProduitId());
            itemForm.setId(String.valueOf(produit.getId()));
            itemForm.setName(produit.getName());
            itemForm.setPrice(produit.getPrix());
            itemForm.setQuantity(article.getQuantite());
            itemForm.setImage("/produit/image/" + produit.getId());
        } catch (NoSuchElementException e) {

            return null;
        }
        return itemForm;
    }



    @DeleteMapping("/panier/item/remove/{articleId}")
    public String supprimerArticle(@PathVariable int articleId, HttpSession session) {
        Long idConnectedUser = UserUtils.findConnectedUserId();
        if (idConnectedUser == null) {
            return "User not logged in";
        }

        panierService.deleteArticleById((long) articleId, idConnectedUser);
        return "Article removed from cart";
    }    // Other methods...
}
