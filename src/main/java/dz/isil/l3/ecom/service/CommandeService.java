package dz.isil.l3.ecom.service;

import dz.isil.l3.ecom.entity.Commande;
import dz.isil.l3.ecom.entity.CommandeArticle;
import dz.isil.l3.ecom.entity.Panier;
import dz.isil.l3.ecom.entity.Produit;
import dz.isil.l3.ecom.repository.CommandeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Service
public class CommandeService {

    @Autowired
    private CommandeRepository commandeRepository;

    @Autowired
    private ProduitService produitService;

    public Panier getCommande(Long userId) {
        return commandeRepository.findByIdUtilisateur(userId);
    }

    public Commande createCommande(Commande commande) {
        return commandeRepository.save(commande);
    }

    public List<Commande> findAllCommandes() {
        List<Commande> commandes = commandeRepository.findAll();

        for (Commande commande : commandes) {
            List<Produit> produits = new ArrayList<>();
            for (CommandeArticle article : commande.getArticles()) {
                Produit produit = articleToProduit(article);
                produits.add(produit);
            }
            commande.setProduits(produits);
        }
        return commandes;
    }

    private Produit articleToProduit(CommandeArticle article) {
        return produitService.getProduitById(article.getProduitId());
    }

    public boolean updateOrderStatus(Long id, int status) {
        Optional<Commande> optionalCommande = commandeRepository.findById((long) Math.toIntExact(id));
        if (optionalCommande.isPresent()) {
            Commande commande = optionalCommande.get();
            commande.setStatut(status);
            commandeRepository.save(commande);
            return true;
        } else {
            return false;
        }
    }

    public boolean deleteCommande(Long id) {
        Optional<Commande> optionalCommande = commandeRepository.findById(id);
        if (optionalCommande.isPresent()) {
            commandeRepository.deleteById(id);
            return true;
        } else {
            return false;
        }
    }
}
