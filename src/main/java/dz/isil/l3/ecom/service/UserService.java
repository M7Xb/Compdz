package dz.isil.l3.ecom.service;

import dz.isil.l3.ecom.entity.Images;
import dz.isil.l3.ecom.entity.Utilisateur;
import dz.isil.l3.ecom.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepos;

    public Utilisateur findByValidationToken(String token) {
        return userRepos.findByValidationToken(token);
    }

    public Utilisateur findByEmail(String email) {
        return userRepos.findByMail(email);
    }

    public Utilisateur save(Utilisateur user) {
        return userRepos.save(user);
    }

    public List<Utilisateur> getAllUser() {
        return userRepos.findAll();
    }

    public void deleteUserById(Long id) {
        userRepos.deleteById((long) Math.toIntExact(id));
    }


    //-----------------------------------------------------------//
    public Utilisateur  findUserById(Long id) {
        return userRepos.findById(id).orElseThrow(() -> new RuntimeException("user not found"));
    }
    public Utilisateur findByNom(String nom) {
        return userRepos.findByNom(nom);
    }



}
