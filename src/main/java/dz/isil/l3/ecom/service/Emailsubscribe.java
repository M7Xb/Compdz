package dz.isil.l3.ecom.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import javax.mail.internet.MimeMessage;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class Emailsubscribe {

    @Autowired
    private JavaMailSender mailSender;

    private static final Logger logger = Logger.getLogger(Emailsubscribe.class.getName());

    public void sendSimpleMessage(String to, String subject, String text) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text);

            mailSender.send(message);
            logger.info("Email sent successfully to " + to);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Failed to send email", e);
            throw new RuntimeException("Failed to send email", e);
        }
    }

}