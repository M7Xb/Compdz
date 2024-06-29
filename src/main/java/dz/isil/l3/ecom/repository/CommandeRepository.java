package dz.isil.l3.ecom.repository;

import dz.isil.l3.ecom.entity.Commande;
import dz.isil.l3.ecom.entity.Panier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommandeRepository extends JpaRepository<Commande, Long> {


    public Panier findByIdUtilisateur(Long idUser);

}
