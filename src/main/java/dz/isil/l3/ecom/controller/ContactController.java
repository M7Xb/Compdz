package dz.isil.l3.ecom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import dz.isil.l3.ecom.service.EmailService1;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ContactController {

    @Autowired
    private EmailService1 emailService;

    @GetMapping("/contact")
    public String showContactForm(HttpServletRequest request) {
        request.setAttribute("message", "");
        return "contact";
    }

    @PostMapping("/sendMail")
    public String sendMail(@RequestParam("fullName") String fullName,
                           @RequestParam("userEmail") String userEmail,
                           @RequestParam("subject") String subject,
                           @RequestParam("message") String message,
                           @RequestParam("imageFile") MultipartFile file,
                           HttpServletRequest request) {
        try {
            emailService.sendSimpleMessageWithAttachment(fullName, userEmail, subject, message, file);
            request.setAttribute("message", "Email sent successfully");
        } catch (Exception e) {
            request.setAttribute("message", "Failed to send email: " + e.getMessage());
        }
        return "contact";
    }
}
