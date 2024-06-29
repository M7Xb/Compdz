package dz.isil.l3.ecom.controller;

import dz.isil.l3.ecom.entity.Category;
import dz.isil.l3.ecom.entity.Produit;
import dz.isil.l3.ecom.entity.Utilisateur;
import dz.isil.l3.ecom.service.CategorieService;
import dz.isil.l3.ecom.service.ProduitService;
import dz.isil.l3.ecom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMapAdapter;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

@Controller
public class ProduitController {

    public final ProduitService produitServ;
    public final CategorieService categorieServ;
    public final UserService utilisateurService;



    @Autowired
    public ProduitController(ProduitService produitServ,
                             CategorieService categorieServ,
                             UserService utilisateurService) {
        this.produitServ = produitServ;
        this.categorieServ = categorieServ;
        this.utilisateurService = utilisateurService;
    }

    @GetMapping("/getProduits")
    public List<Produit> getAllProduit() {
        List<Produit> mesProduits = produitServ.getAllProduits();

        return mesProduits;
    }

    @GetMapping("/getProduits/{name}")
    public List<Produit> getSearchProduits(@PathVariable("name") String nomProduit) {
        List<Produit> mesProduits = produitServ.getProduitByName(nomProduit);

        return mesProduits;
    }


    /*
    @GetMapping("/getProduits/{name}")
    public String getSearchProduits(@PathVariable("name") String nomProduit, Model model) {
        List<Produit> mesProduits = produitServ.getProduitByName(nomProduit);

        model.addAttribute("Produit", mesProduits);

        return "toto";
    }

     */

    @PostMapping(value = "/addProduit",
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @ResponseStatus(HttpStatus.OK)
    public ModelAndView ajouterProduit(
            @RequestParam("productName") String productName,
            @RequestParam("productPrice") Double productPrice,
            @RequestParam("productDescription") String productDescription,
            @RequestParam("productCategory") Integer productCategory,
            @RequestParam("productImage") MultipartFile file) throws IOException {

        MultiValueMapAdapter<String, String> formData = null;

        Produit produit = new Produit();
        produit.setName(productName);
        produit.setPrix(productPrice);
        produit.setImage(file.getBytes());

        produit.setQuantiteStock(1000);
        produit.setDescription(productDescription);

        Category selectedCategorie = categorieServ.getCategorieById(productCategory);
        produit.setCategory(selectedCategorie);

        Produit addedProduit = produitServ.ajouterProduit(produit);

        ModelAndView modelAndView = new ModelAndView();
        remplirAdminPage(modelAndView);
        if(addedProduit == null) {
            modelAndView.addObject("errorMessage", "Impossible d'ajouter cet produit");
        }
        modelAndView.setViewName("adminpanel");
        return modelAndView;
    }

    @PostMapping(value = "/updateProduit",
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @ResponseStatus(HttpStatus.OK)
    public ModelAndView modifierProduit(
            @RequestParam("productId") int productId,
            @RequestParam("productName") String productName,
            @RequestParam("productPrice") Double productPrice,
            @RequestParam("productDescription") String productDescription,
            @RequestParam("productCategory") Integer productCategory,
            @RequestParam("productImage") MultipartFile file) throws IOException {

        MultiValueMapAdapter<String, String> formData = null;

        Produit produit = new Produit();
        produit.setId(productId);
        produit.setName(productName);
        produit.setPrix(productPrice);
        produit.setImage(file.getBytes());

        produit.setQuantiteStock(1000);
        produit.setDescription(productDescription);

        Category selectedCategorie = categorieServ.getCategorieById(productCategory);
        produit.setCategory(selectedCategorie);

        Produit addedProduit = produitServ.modifierProduit(produit, productId);

        ModelAndView modelAndView = new ModelAndView();
        remplirAdminPage(modelAndView);
        if(addedProduit == null) {
            modelAndView.addObject("errorMessage", "Impossible de modifier le produit " + productId );
        }
        modelAndView.setViewName("adminpanel");
        return modelAndView;
    }

    @PostMapping(value = "/updateProduit",
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
    public ModelAndView supprimerProduit(
            @RequestParam("productId") int productId) throws IOException {

        boolean deletedProduit = produitServ.supprimerProduitById(productId);

        ModelAndView modelAndView = new ModelAndView();
        remplirAdminPage(modelAndView);
        if(!deletedProduit) {
            modelAndView.addObject("errorMessage", "Impossible de modifier le produit " + productId );
        }
        modelAndView.setViewName("adminpanel");
        return modelAndView;
    }

    private void remplirAdminPage(ModelAndView modelAndView) {
        // Afficher tous les categories
        List<Category> categories = categorieServ.getAllCategories();
        modelAndView.addObject("categoriesList", categories);

        //Afficher tous les produits
        List<Produit> produits = produitServ.getAllProduits();
        modelAndView.addObject("produitsList", produits);

        //Afficher tous les utilisateurs
        List<Utilisateur> utilisateur = utilisateurService.getAllUser();
        modelAndView.addObject("utilisateursList", utilisateur);
    }

    public String convertFileToBase64(MultipartFile file) throws IOException {
        byte[] fileBytes = file.getBytes();
        return Base64.getEncoder().encodeToString(fileBytes);
    }



   @GetMapping("/deleteProduit/{id}")
public String deleteProduit(@PathVariable("id") Long produitId, RedirectAttributes redirectAttributes) {
    try {
        produitServ.deleteProduitById(produitId);
        redirectAttributes.addFlashAttribute("successMessage", "Product has been deleted successfully.");
    } catch (Exception e) {
        redirectAttributes.addFlashAttribute("errorMessage", "Error occurred while deleting the product.");
    }
    return "redirect:/admin";
}


    @PostMapping("/editProduit/{id}")
    public String editProduit(@PathVariable("id") Long productId,
                              @RequestParam("productName") String productName,
                              @RequestParam("productPrice") Double productPrice,
                              @RequestParam("productCategory") Integer productCategory,
                              @RequestParam("productDescription") String productDescription,
                              @RequestParam("productImage") MultipartFile file,
                              RedirectAttributes redirectAttributes) {
        Produit produit = produitServ.getProduitById(Math.toIntExact(productId));
        if (produit != null) {
            produit.setName(productName);
            produit.setPrix(productPrice);
            produit.setDescription(productDescription);
            if (!file.isEmpty()) {
                try {
                    produit.setImage(file.getBytes());
                } catch (IOException e) {
                    redirectAttributes.addFlashAttribute("errorMessage", "Failed to upload image.");
                    return "redirect:/admin";
                }
            }
            Category selectedCategory = categorieServ.getCategorieById(productCategory);
            produit.setCategory(selectedCategory);
            produitServ.modifierProduit(produit,Math.toIntExact(productId));
            redirectAttributes.addFlashAttribute("successMessage", "Product has been updated successfully.");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Product not found.");
        }
        return "redirect:/admin";
    }





}
