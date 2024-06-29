package dz.isil.l3.ecom.repository;

import dz.isil.l3.ecom.entity.Category;
import dz.isil.l3.ecom.entity.Produit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
}