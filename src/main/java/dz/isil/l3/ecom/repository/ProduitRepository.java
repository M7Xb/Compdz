package dz.isil.l3.ecom.repository;

import dz.isil.l3.ecom.entity.Produit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProduitRepository extends JpaRepository<Produit, Integer> {



    public List<Produit> findByName(String nomProduit);
}
