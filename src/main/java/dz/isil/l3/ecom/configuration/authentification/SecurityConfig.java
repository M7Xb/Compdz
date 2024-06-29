package dz.isil.l3.ecom.configuration.authentification;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
//@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring()
                .antMatchers(
                        "/bootstrap/**",
                        "/bootstrap-icons-1.11.3/**",
                        "/css/**",
                        "/images/**",
                        "/static/**",
                        "/resources/**",
                        "/js/**",
                        "/css/**",
                        "/images/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .sessionManagement()
                .sessionFixation().migrateSession()
                //.invalidSessionUrl("/invalidSession.html")
                .maximumSessions(1);
                //.expiredUrl("/sessionExpired.html");

        http
                .csrf()
                    .disable()
                .authorizeRequests()
                    .antMatchers("/login").permitAll()
                    .antMatchers("/signup").permitAll()
                    .antMatchers("/user/signup").permitAll()
                    .antMatchers("/validate").permitAll()
                    .antMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest()
                    .authenticated()
                .and()
                    .formLogin()
                        .loginPage("/login")
                        .permitAll()
                .and()
                    .logout()
                        .logoutUrl("/logout") // Spécifiez l'URL de déconnexion
                        .logoutSuccessUrl("/home?logout") // Redirigez vers cette URL après la déconnexion
                        .invalidateHttpSession(true) // Invalidez la session après la déconnexion
                        .deleteCookies("JSESSIONID") // Supprimez les cookies après la déconnexion
                        .permitAll();
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}

