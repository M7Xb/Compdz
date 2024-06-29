package dz.isil.l3.ecom.utlis;
import dz.isil.l3.ecom.configuration.authentification.CustomUser;
import dz.isil.l3.ecom.entity.Utilisateur;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import java.util.UUID;

public class UserUtils {


    public static UserDetails findConnectedUserInSession() {
        // Récupérer l'objet d'authentification actuel
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        // Vérifier si l'utilisateur est authentifié
        if (authentication != null && authentication.isAuthenticated()) {
            // Récupérer les détails de l'utilisateur
            Object principal = authentication.getPrincipal();

            if (principal instanceof UserDetails) {
                return (UserDetails) principal;
            }
        }
        return null;
    }

    public static Long findConnectedUserId() {
        // Récupérer l'objet d'authentification actuel
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        // Vérifier si l'utilisateur est authentifié
        if (authentication != null && authentication.isAuthenticated()) {
            // Récupérer les détails de l'utilisateur
            Object principal = authentication.getPrincipal();

            if (principal instanceof CustomUser) {
                return ((CustomUser) principal).getUtilisateur().getIdUser();
            }
        }
        return null;
    }

    public static Utilisateur findConnectedUserInfos() {
        // Récupérer l'objet d'authentification actuel
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        // Vérifier si l'utilisateur est authentifié
        if (authentication != null && authentication.isAuthenticated()) {
            // Récupérer les détails de l'utilisateur
            Object principal = authentication.getPrincipal();

            if (principal instanceof CustomUser) {
                return ((CustomUser) principal).getUtilisateur();
            }
        }
        return null;
    }

    public static String generateValidationToken() {
        return UUID.randomUUID().toString();
    }
}
