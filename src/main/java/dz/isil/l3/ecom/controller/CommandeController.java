package dz.isil.l3.ecom.controller;

import dz.isil.l3.ecom.entity.*;
import dz.isil.l3.ecom.formulaire.InfoCommandeForm;
import dz.isil.l3.ecom.service.CommandeService;
import dz.isil.l3.ecom.service.PanierService;
import dz.isil.l3.ecom.utlis.MethodPaymentEnum;
import dz.isil.l3.ecom.utlis.StatutCommandeEnum;
import dz.isil.l3.ecom.utlis.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class CommandeController {

    private final CommandeService commandeService;
    private final PanierService panierService;

    @Autowired
    public CommandeController(CommandeService commandeService, PanierService panierService) {
        this.commandeService = commandeService;
        this.panierService = panierService;
    }

    @PostMapping("/commande/valide")
    public ResponseEntity<String> validerPanierToCommande(@RequestBody InfoCommandeForm infoCommandeForm) {
        Long idConnectedUser = UserUtils.findConnectedUserId();
        Panier panier = getPanier(idConnectedUser);

        Commande commande = createCommandeByPanier(infoCommandeForm, panier, idConnectedUser);

        Commande createdCommande = commandeService.createCommande(commande);

        // vider le panier
        panierService.deletePanier(panier.getIdPanier());

        // Return a success response
        return ResponseEntity.status(HttpStatus.OK).body("Commande ajoutée avec succès");
    }

    @PostMapping("/commande/{orderId}/status")
    public String updateOrderStatus(@PathVariable Long orderId, @RequestParam int status, RedirectAttributes redirectAttributes) {
        boolean isUpdated = commandeService.updateOrderStatus(orderId, status);
        if (isUpdated) {
            redirectAttributes.addFlashAttribute("message", "Order status updated successfully.");
        } else {
            redirectAttributes.addFlashAttribute("message", "Failed to update order status.");
        }
        return "redirect:/admin"; // This should redirect to your admin page
    }


    private Commande createCommandeByPanier(InfoCommandeForm infoCommandeForm, Panier panier, Long idConnectedUser) {
        Commande commande = new Commande();
        commande.setArticles(getCmdArticle(panier.getArticles()));
        commande.setStatut(StatutCommandeEnum.EN_ATTENTE_VALIDATION.getId());
        commande.setDateCreation(new Date());
        commande.setIdUtilisateur(idConnectedUser);

        // information de livraison
        commande.setNom(infoCommandeForm.getNom());
        commande.setPrenom(infoCommandeForm.getPrenom());
        commande.setAdress(infoCommandeForm.getAdress());
        commande.setWilaya(infoCommandeForm.getWilaya());
        commande.setCodePostal(infoCommandeForm.getCodePostal());
        commande.setEmail(infoCommandeForm.getEmail());
        commande.setPrice(infoCommandeForm.getPrice());
        commande.setMethodPayment(MethodPaymentEnum.PAIEMENT_A_RECEPTION.getId());

        return commande;
    }

    private List<CommandeArticle> getCmdArticle(List<Article> articles) {
        if (articles == null || articles.isEmpty()) {
            return null;
        }
        List<CommandeArticle> cmdArticleList = new ArrayList<>();
        for (Article article : articles) {
            CommandeArticle cmdArticle = new CommandeArticle();
            cmdArticle.setQuantite(article.getQuantite());
            cmdArticle.setProduitId(article.getProduitId());
            cmdArticleList.add(cmdArticle);
        }
        return cmdArticleList;
    }

    public Panier getPanier(Long idConnectedUser) {
        return panierService.getPanier(idConnectedUser);
    }


    @GetMapping("/commande/{orderId}")
    public String deleteCommande(@PathVariable Long orderId, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        boolean isDeleted = commandeService.deleteCommande(orderId);
        if (isDeleted) {
            redirectAttributes.addFlashAttribute("message", "Commande supprimée avec succès");
        } else {
            redirectAttributes.addFlashAttribute("message", "Commande non trouvée");
        }

        // Get the referer header to redirect back to the same page
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
}
