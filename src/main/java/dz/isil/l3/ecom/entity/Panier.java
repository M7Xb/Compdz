package dz.isil.l3.ecom.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "PANIER")
public class Panier {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long idPanier;

    private Long idUtilisateur;

    private Date dateDernierMaj;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Article> articles;

    public void addArticle(Article ar) {
        if(this.articles == null) {
            this.articles = new ArrayList<>();
        }
        this.articles.add(ar);
    }

    public void deleteArticleById(int articleId) {
        if (this.articles != null) {
            this.articles.removeIf(article -> article.getProduitId() == articleId);
        }
    }


    public Article findArticleByIdProduit(Long produitId) {
        if(this.articles == null || articles.isEmpty()){
            return null;
        }
        return this.articles.stream()
                .filter(article -> article.getProduitId()==(produitId))
                .findFirst()
                .orElse(null);
    }
}
