package dz.isil.l3.ecom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import javax.mail.internet.MimeMessage;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class EmailService1 {

    @Autowired
    private JavaMailSender mailSender;

    private static final Logger logger = Logger.getLogger(EmailService1.class.getName());

    public void sendSimpleMessageWithAttachment(String fullName, String userEmail, String subject, String text, MultipartFile file) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            // Set the recipient and Reply-To address
            helper.setTo("compdz.help@gmail.com");
            helper.setReplyTo(userEmail);
            helper.setSubject(subject);

            // Format the email text
            String fullMessage = String.format(
                    "Sender Name: %s\n" +
                            "Sender Email: %s\n" +
                            "Subject: %s\n" +
                            "Message:\n%s",
                    fullName, userEmail, subject, text
            );
            helper.setText(fullMessage);

            if (file != null && !file.isEmpty()) {
                helper.addAttachment(Objects.requireNonNull(file.getOriginalFilename()), file);
            }

            mailSender.send(message);
            logger.info("Email sent successfully  from " + userEmail);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Failed to send email", e);
            throw new RuntimeException("Failed to send email", e);
        }
    }
}
