package dz.isil.l3.ecom.repository;

import dz.isil.l3.ecom.entity.Panier;
import dz.isil.l3.ecom.entity.Produit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface PanierRepository extends JpaRepository<Panier, Long> {


    public Panier findByIdUtilisateur(Long idUser);

    @Modifying
    @Transactional
    @Query("DELETE FROM Article ar WHERE ar.produitId = :itemId AND ar IN (SELECT p.articles FROM Panier p WHERE p.idPanier = :panierId)")
    void deleteArticleFromPanier(@Param("panierId") Long panierId, @Param("itemId") int itemId);
}
