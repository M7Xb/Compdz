package dz.isil.l3.ecom.service;

import dz.isil.l3.ecom.entity.Produit;
import dz.isil.l3.ecom.repository.ProduitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.NoSuchElementException;

@Service
public class ProduitService {

    @Autowired // Autowired est utilisé pour l'Injection de Dépendence (initialisation automatique d'attribut)
    private ProduitRepository produitRepos;

    public void deleteProduitById(Long productId) {
        produitRepos.deleteById(Math.toIntExact(productId));
    }


    /**
     * Ajouter un produit dans la BDD
     * @param produit Le produit à ajouter dans la BDD
     * @return saved produit
     */
    public Produit ajouterProduit(Produit produit) {
        return produitRepos.save(produit);
    }

    /**
     * Retourner la liste de tous les produits qui existent en BDD
     * @return liste produits
     */
    public List<Produit> getAllProduits(){
        return produitRepos.findAll();
    }

    /**
     * Retourner un produit ayant l'identifiant passé en paramètre
     * @param id identifiant produit
     * @return produit
     */
    public Produit getProduitById(int id) {
        return produitRepos.findById(id)
                .orElseThrow(() -> new NoSuchElementException("Produit with id " + id + " not found"));
    }
    /**
     * suppression d'un produit de la BDD
     * @param id l'identifiant du produit à supprimer de la BDD
     */
    public boolean supprimerProduitById(int id){

        // Tester si ce produit existe bien dans la bdd
        boolean exist = produitRepos.existsById(id);
        if(exist) {
            produitRepos.deleteById(id);
            return true;
        } else {
            return false;
        }
    }

    /**
     * modification d'un produit du catalogueBoissons dans la BDD
     * @param id l'identifiant du catalogueBoissons à modifier dans la BDD
     */
    public Produit modifierProduit(Produit produit, int id){
        // Tester si ce produit existe bien dans la bdd
        boolean exist = produitRepos.existsById(id);
        if(exist) {
            return produitRepos.save(produit);
        } else {
            return null;
        }
    }



    /**
     *  retourner les produits ayant le nom passé en paramètre
     * @param nomProduit
     * @return
     */
    public List<Produit> getProduitByName(String nomProduit) {
        List<Produit> produits = produitRepos.findByName(nomProduit);

        return produits;
    }
}
