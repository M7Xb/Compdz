package dz.isil.l3.ecom.configuration;

import dz.isil.l3.ecom.entity.Utilisateur;
import dz.isil.l3.ecom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class DatabaseInitializer implements CommandLineRunner {

    private final UserService userService;

    private final PasswordEncoder passwordEncoder;

    @Autowired
    public DatabaseInitializer(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) throws Exception {
        // Vérifiez s'il y a déjà des utilisateurs dans la base de données
        if (userService.findByEmail("admin@gmail.com") == null) {
            // S'il n'y a pas d'utilisateurs, initialisez la base de données avec un utilisateur
            Utilisateur user = new Utilisateur();
            user.setNom("admin");
            user.setLogin("admin@gmail.com");
            user.setMail("admin@gmail.com");
            user.setValide(true);
            user.setRole("ADMIN");
            // Encodez le mot de passe avant de l'enregistrer dans la base de données
            user.setEncriptedPassword(passwordEncoder.encode("admin123"));
            userService.save(user);
        }
    }
}
