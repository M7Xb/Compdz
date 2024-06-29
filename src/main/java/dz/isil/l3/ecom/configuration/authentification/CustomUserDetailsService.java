package dz.isil.l3.ecom.configuration.authentification;

import dz.isil.l3.ecom.entity.Utilisateur;
import dz.isil.l3.ecom.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Collection;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        Utilisateur user = userRepository.findByLogin(login);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with login: " + login);
        }

        // Ajouter le role de l'utilisateur connecté
        Collection<GrantedAuthority> authorityList = new ArrayList<>();
        if(user.getRole() != null) {
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority("ROLE_" + user.getRole());
            authorityList.add(grantedAuthority);
        }
        // Créez et returnez  votre implémentation de CustomUser à partir des données de votre utilisateur
        return new CustomUser(user.getNom(), user.getEncriptedPassword(), authorityList, user);
    }

    public void authenticateUser(String username, String password) {
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
        Authentication authentication = authenticationManager.authenticate(token);
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }
}

