package dz.isil.l3.ecom.controller;

import dz.isil.l3.ecom.configuration.authentification.CustomUserDetailsService;
import dz.isil.l3.ecom.entity.*;
import dz.isil.l3.ecom.formulaire.UserForm;
import dz.isil.l3.ecom.service.*;
import dz.isil.l3.ecom.utlis.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    CustomUserDetailsService authService;

    @Autowired
    UserService userService;

    @Autowired
    public CategorieService categorieServ;
    @Autowired
    public ProduitService produitServ;
    @Autowired
    public UserService utilisateurService;
    @Autowired
    public ImageService imageService;
    @Autowired
    public DealProductService dealProductService;
    @Autowired
    public CommentService commentService;
    @Autowired
    private AdsService adsService;
    @Autowired
    private CommandeService commandeService;


    @GetMapping({"","/home", "/home.jsp"})
    public ModelAndView helloPage() {
        ModelAndView modelAndView = new ModelAndView();

        // Récupérer la liste des produits
        remplirHomePage(modelAndView);

        modelAndView.setViewName("home");
        return modelAndView;
    }
    @GetMapping({ "/home.jsp"})
    public ModelAndView showNavbarPage() {
        ModelAndView modelAndView = new ModelAndView();

        // Récupérer la liste des produits
        remplirHomePage(modelAndView);

        modelAndView.setViewName("navbar");
        return modelAndView;
    }


    @PostMapping({"/login", "login.jsp"})
    public ModelAndView login(@ModelAttribute UserForm userForm) {
        if(userForm != null && userForm.getUsername() != null)
        {
            authService.authenticateUser(userForm.getUsername(), userForm.getPassword());
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("home");
        return modelAndView;
    }

    @GetMapping("/login")
    public ModelAndView showLoginForm() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @GetMapping({"/signup", "/signup.jsp"})
    public ModelAndView showSignupForm() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("signup");
        return modelAndView;
    }
    @GetMapping({"/product", "/produit"})
    public ModelAndView Showproduit() {
        ModelAndView modelAndView = new ModelAndView();

        // Récupérer la liste des produits
        remplirHomePage(modelAndView);

        modelAndView.setViewName("product");
        return modelAndView;
    }
    @GetMapping({"/admin", "/adminpanel"})
    public ModelAndView Showadmin() {
        ModelAndView modelAndView = new ModelAndView();

        // remplir la page admin
        remplirAdminPage(modelAndView);

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

        //Afficher tous les images

        List<Images> images = imageService.getAllImages();;
        modelAndView.addObject("imagesList", images);

        //Afficher tous les utilisateurs
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

    private void remplirHomePage(ModelAndView modelAndView) {
        // Afficher tous les categories
        List<Category> categories = categorieServ.getAllCategories();
        modelAndView.addObject("categoriesList", categories);

        //Afficher tous les images
        List<Images> images = imageService.getAllImages();;
        modelAndView.addObject("imagesList", images);


        //Afficher tous les produits
        List<Produit> produits = produitServ.getAllProduits();
        modelAndView.addObject("produitsList", produits);

        //Afficher tous les deal products
        List<DealProduct> dealProducts = dealProductService.getAllDealProducts();
        modelAndView.addObject("dealProducts", dealProducts);

        //Afficher tous les comments
        List<Comment> comments = commentService.getAllComments();
        modelAndView.addObject("comments", comments);

        //Afficher tous les ads
        List<Ads> ads = adsService.getAllAds();
        modelAndView.addObject("Ads", ads);

        //Afficher tous les utilisateurs
        List<Utilisateur> utilisateur = utilisateurService.getAllUser();
        modelAndView.addObject("utilisateursList", utilisateur);
        //Afficher tous les utilisateurs connectés
        Utilisateur Utilisateur = UserUtils.findConnectedUserInfos();
        modelAndView.addObject("utilisateurConnecte", Utilisateur);

        // Afficher la liste des commandes
        List<Commande> commandes = commandeService.findAllCommandes();
        modelAndView.addObject("commandesList", commandes);

    }

    private void remplirProfilePage(ModelAndView modelAndView) {
        Utilisateur utilisateur = UserUtils.findConnectedUserInfos();
        modelAndView.addObject("utilisateurConnecte", utilisateur);
    }

    @GetMapping({"/blog"})
    public ModelAndView ShowBlog() {
        ModelAndView modelAndView = new ModelAndView();
        // Récupérer la liste des images
        remplirHomePage(modelAndView);
        modelAndView.setViewName("blog");
        return modelAndView;
    }
    @GetMapping({"/profile","/userprofile"})
    public ModelAndView ShowProfile() {
        ModelAndView modelAndView = new ModelAndView();

        // ajouter les information du profile
        remplirProfilePage(modelAndView);

        modelAndView.setViewName("user-profile");
        return modelAndView;
    }

}
