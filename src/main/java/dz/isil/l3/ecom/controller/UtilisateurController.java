package dz.isil.l3.ecom.controller;

import dz.isil.l3.ecom.entity.Comment;
import dz.isil.l3.ecom.entity.Utilisateur;
import dz.isil.l3.ecom.formulaire.UtilisateurForm;
import dz.isil.l3.ecom.service.EmailService;
import dz.isil.l3.ecom.service.UserService;
import dz.isil.l3.ecom.utlis.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.Objects;

@Controller
//@RequestMapping("/user")
public class UtilisateurController {

    @Autowired
    private UserService userService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    EmailService emailService;

    @PostMapping("/signup")
    public String creerClient(Model model, @ModelAttribute UtilisateurForm newUtilisateurForm) {
        String returnPage = "signup";
        String message = validationFormulaireDeCreation(newUtilisateurForm);

        //ModelAndView modelAndView = new ModelAndView();
        if(message == null) {
            Utilisateur savedUser = null;
            Utilisateur newUtilisateur = utilisteurFormToUtilisateurEntity(newUtilisateurForm);
            savedUser = this.userService.save(newUtilisateur);
            if(savedUser != null && savedUser.getIdUser() != null) {
                returnPage = "login";
                // envoyer un email pour l activation du compte
                emailService.sendValidationEmail(savedUser.getMail(), savedUser.getValidationToken());
                message = "Votre compte est créé et en attente d'activation. Vous allez recevoir un email pour l'activer";
            } else {
                message = "Impossible de créer voter compte. " + message;
            }
        }
        //modelAndView.addObject("message", message);
        //modelAndView.setViewName("signup");
        //return modelAndView;


        model.addAttribute("message", message);
        return returnPage;
    }

    private Utilisateur utilisteurFormToUtilisateurEntity(UtilisateurForm newUtilisateurForm) {
        Utilisateur user = new Utilisateur();
        user.setLogin(newUtilisateurForm.getEmail());
        user.setEncriptedPassword(passwordEncoder.encode(newUtilisateurForm.getPassword()));
        user.setValide(false);
        user.setAdress(newUtilisateurForm.getAdresse());
        user.setMail(newUtilisateurForm.getEmail());
        user.setNom(newUtilisateurForm.getName());
        user.setPrenom(newUtilisateurForm.getPrenom());
        user.setRole( "USER");
        user.setDateInscription(new Date());
        String validateToken = UserUtils.generateValidationToken();
        user.setValidationToken(validateToken);


        return user;
    }

    private String validationFormulaireDeCreation(UtilisateurForm user) {
        // Validation du formulaire
        String message = null;

        if(!StringUtils.hasText(user.getName())) {
            message = "Il faut rensegner le nom. ";
        }
        if(!StringUtils.hasText(user.getPrenom())) {
            message = "Il faut rensegner le prenom. ";
        }
        if(!StringUtils.hasText(user.getAdresse())) {
            message = "Il faut rensegner l'adresse. ";
        }
        if(!StringUtils.hasText(user.getPassword())) {
            message = "Il faut rensegner le mot de passe. ";
        }
        if(!StringUtils.hasText(user.getPassword())) {
            message = "Il faut rensegner le mot de passe. ";
        }
        if(user.getPassword() != null && !user.getPassword().equals(user.getReapetPassword())) {
            message = "Le mot de passe et sa répétition ne sont pas identique. ";
        }
        if(!StringUtils.hasText(user.getEmail())) {
            message = "Il faut rensegner le email. ";
        }
        // verifier s il existe un compte avec cette email
        Utilisateur existingUser = this.userService.findByEmail(user.getEmail());
        if(existingUser != null) {
            message = "Il existe déjà un autre compte avec cet email. ";
        }

        return message;
    }

    @GetMapping("/validate")
    public ModelAndView validateAccount(@RequestParam("token") String token) {
        ModelAndView modelAndView = new ModelAndView();
        Utilisateur user = userService.findByValidationToken(token);
        if (user != null) {
            user.setValide(true);
            user.setValidationToken(null);
            userService.save(user);
            modelAndView.addObject("validationMessage","account-validated");
        } else {
            modelAndView.addObject("validationMessage","invalid-token");

        }
        modelAndView.setViewName("login");
        return modelAndView;
    }
    //    delete user in admin page
    @GetMapping("/admin/deleteUser/{id}")
    public String deleteUser(@PathVariable("id") Long id) {

        userService.deleteUserById(id);
        return "redirect:/admin";
    }

//    -------------------------------------------------------------------------------//

    @PostMapping("/updateProfile/{id}")
    public String updateProfile(
            @PathVariable("id") Long iduser,
            @RequestParam("username") String username,
            @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("Password2") String password2
            ) {
        Utilisateur user = userService.findUserById(iduser);

            if (user != null) {
                if (Objects.equals(password, password2)) {
                user.setIdUser(iduser); // Update the user's id
                user.setLogin(username); // Update the login
                user.setNom(firstName);
                user.setPrenom(lastName);
                user.setMail(email);
                user.setEncriptedPassword(passwordEncoder.encode(password)); // Hash the password before saving it
                userService.save(user);

                    return "redirect:/home";
                } else {
                    return "redirect:/profile"; // Passwords do not match
                }
            } else {
                return "redirect:/profile"; // User not found
            }
    }


    @PostMapping("/updateProfileAdmin/{id}")
    public String updateProfileAdmin(
            @PathVariable("id") Long adminId,
            @RequestParam("adminName") String username,
            @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("email") String email,
            @RequestParam("adminPassword") String password,
            @RequestParam("adminPassword2") String password2) {
        Utilisateur user = userService.findUserById(adminId);

        if (user != null) {
            if (Objects.equals(password, password2)) {
                user.setIdUser(adminId);
                user.setLogin(username);
                user.setNom(firstName);
                user.setPrenom(lastName);
                user.setMail(email);
                user.setEncriptedPassword(passwordEncoder.encode(password));
                userService.save(user);
                return "redirect:/admin";
            } else {
                return "redirect:/error"; // Passwords do not match
            }
        } else {
            return "redirect:/error"; // User not found
        }
    }



}
