package dz.isil.l3.ecom.repository;

import dz.isil.l3.ecom.entity.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<Utilisateur, Long> {


    Utilisateur findByLogin(String login);

    Utilisateur findByValidationToken(String token);

    Utilisateur findByMail(String email);

    Utilisateur findByNom(String username);
}
