package dz.isil.l3.ecom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendValidationEmail(String to, String validationToken) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject("Validation de compte");
        message.setFrom("compdz.help@gmail.com");
        message.setText("Veuillez cliquer sur le lien suivant pour valider votre compte : "
                + "http://localhost:8081/validate?token=" + validationToken);
        mailSender.send(message);
    }
}
