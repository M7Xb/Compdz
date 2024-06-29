package dz.isil.l3.ecom.service;

import dz.isil.l3.ecom.entity.Article;
import dz.isil.l3.ecom.entity.Panier;
import dz.isil.l3.ecom.repository.PanierRepository;
import dz.isil.l3.ecom.repository.ProduitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;


@Service
public class PanierService {

    @Autowired
    private PanierRepository panierRepository;

    @Autowired
    private ProduitRepository produitRepos;

    public void deleteArticleById(Long articleId, Long userId) {
        Panier panier = panierRepository.findByIdUtilisateur(userId);
        if (panier != null) {
            panier.deleteArticleById(Math.toIntExact(articleId)); // Assuming you have a method to delete an article by its ID in the Panier class
            panierRepository.save(panier); // Save the updated panier
        }
    }


    public Panier ajouterArticle(Long articleId, Long userId) {
        Panier panier = panierRepository.findByIdUtilisateur(userId);
        if (panier != null) {
            Article existingArticle = panier.findArticleByIdProduit(articleId);
            if (existingArticle == null) {
                existingArticle = new Article();
                existingArticle.setProduitId(articleId.intValue());
                existingArticle.setQuantite(1);
                panier.addArticle(existingArticle);
            } else {
                existingArticle.setQuantite(existingArticle.getQuantite() + 1);
            }

            panier.setDateDernierMaj(new Date());
            return panierRepository.save(panier);
        } else {
            panier = new Panier();
            panier.setIdUtilisateur(userId);
            Article article = new Article();
            article.setProduitId(articleId.intValue());
            article.setQuantite(1);
            panier.addArticle(article);
            panier.setDateDernierMaj(new Date());
            return panierRepository.save(panier);
        }
    }

    public Panier SupprimerArticle(Long articleId, Long userId) {
        Panier panier = panierRepository.findByIdUtilisateur(userId);
        if (panier != null) {
            Article existingArticle = panier.findArticleByIdProduit(articleId);
            if (existingArticle != null) {
                if (existingArticle.getQuantite() > 1) {
                    existingArticle.setQuantite(existingArticle.getQuantite() - 1);
                    // Update the panier in the database
                    panier.setDateDernierMaj(new Date());
                    return panierRepository.save(panier);
                } else {
                    // If the quantity is already 1, do nothing or you may choose to remove the article entirely from the cart
                    // In this example, let's just return the unchanged panier
                    return panier;
                }
            }
        }
        return null;
    }


    public Panier getPanier(Long userId) {
        return panierRepository.findByIdUtilisateur(userId);
    }


    public void deletePanier(Long idPanier) {
        panierRepository.deleteById(idPanier);
    }
}
