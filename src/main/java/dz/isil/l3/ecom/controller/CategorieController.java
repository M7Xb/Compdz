package dz.isil.l3.ecom.controller;

import dz.isil.l3.ecom.entity.*;
import dz.isil.l3.ecom.service.*;
import dz.isil.l3.ecom.utlis.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMapAdapter;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class CategorieController {

    public final CategorieService categorieServ;
    public final ProduitService produitServ;
    public final UserService utilisateurService;
    public final DealProductService dealProductService;
    public final CommentService commentService;
    private final AdsService adsService;
    private final CommandeService commandeService;

    @Autowired
    public CategorieController(CategorieService categorieServ, ProduitService produitServ, UserService utilisateurService,
                               DealProductService dealProductService, CommentService commentService, AdsService adsService, CommandeService commandeService)
    {
        this.categorieServ = categorieServ;
        this.produitServ = produitServ;
        this.utilisateurService = utilisateurService;
        this.dealProductService = dealProductService;
        this.commentService = commentService;
        this.adsService = adsService;
        this.commandeService = commandeService;
    }

    @GetMapping("/getCategory")
    public ModelAndView getAllCategorie() {
        List<Category> categories = categorieServ.getAllCategories();
        ModelAndView modelAndView = new ModelAndView();
        if (categories != null && !categories.isEmpty()) {
            modelAndView.addObject("categoriesList", categories);
        }
        modelAndView.setViewName("adminpanel");
        return modelAndView;
    }

    @GetMapping("/getCategory/{id}")
    public Category getSearchCategorieById(@PathVariable("id") Integer idCategorie) {
        return categorieServ.getCategorieById(idCategorie);
    }

    @PostMapping(value = "/addCategory", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    @ResponseStatus(HttpStatus.OK)
    public ModelAndView ajouterCategory(@RequestBody MultiValueMapAdapter<String, String> formData) {
        Category category = new Category();
        category.setNomCategorie(formData.getFirst("nomCategorie"));
        Category addedCategory = categorieServ.ajouterProduit(category);
        ModelAndView modelAndView = new ModelAndView();
        remplirAdminPage(modelAndView);
        if (addedCategory == null) {
            modelAndView.addObject("errorMessage", "Impossible d'ajouter cette catégorie");
        }
        modelAndView.setViewName("adminpanel");
        return modelAndView;
    }
@PostMapping(value = "/editCategory", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
@ResponseStatus(HttpStatus.OK)
public ModelAndView editCategory(@RequestParam("id") Integer id, @RequestParam("nomCategorie") String nomCategorie, RedirectAttributes redirectAttributes) {
    Category category = categorieServ.getCategorieById(id);
    if (category!= null) {
        category.setNomCategorie(nomCategorie);
        categorieServ.updateCategory(category);
        redirectAttributes.addFlashAttribute("successMessage", "Category updated successfully!");
    } else {
        redirectAttributes.addFlashAttribute("errorMessage", "Category not found.");
    }

    ModelAndView modelAndView = new ModelAndView();
    remplirAdminPage(modelAndView);
    modelAndView.setViewName("adminpanel");
    return modelAndView;
}


    @GetMapping("/deleteCategory/{id}")
    public String deleteCategory(@PathVariable("id") Integer categoryId, RedirectAttributes redirectAttributes) {
        try {
            categorieServ.deleteCategoryById(categoryId);
            redirectAttributes.addFlashAttribute("successMessage", "Category deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error deleting category. It may be used by one or more products.");
        }
        return "redirect:/admin";
    }

    private void remplirAdminPage(ModelAndView modelAndView) {
        // Afficher tous les categories
        List<Category> categories = categorieServ.getAllCategories();
        modelAndView.addObject("categoriesList", categories);

        // Afficher tous les produits
        List<Produit> produits = produitServ.getAllProduits();
        modelAndView.addObject("produitsList", produits);

        // Afficher tous les utilisateurs
        List<Utilisateur> utilisateur = utilisateurService.getAllUser();
        modelAndView.addObject("utilisateursList", utilisateur);

        //Afficher tous les deal products
        List<DealProduct> dealProducts = dealProductService.getAllDealProducts();
        modelAndView.addObject("dealProducts", dealProducts);
        //Afficher tous les comments
        List<Comment> comments = commentService.getAllComments();
        modelAndView.addObject("comments", comments);

        //Afficher tous les ads
        List<Ads> ads = adsService.getAllAds();
        modelAndView.addObject("Ads", ads);

        //Afficher l'utilisateurs connectés
        Utilisateur Utilisateur = UserUtils.findConnectedUserInfos();
        modelAndView.addObject("utilisateurConnecte", Utilisateur);

        // Afficher la liste des commandes
        List<Commande> commandes = commandeService.findAllCommandes();
        modelAndView.addObject("commandesList", commandes);
    }
}
