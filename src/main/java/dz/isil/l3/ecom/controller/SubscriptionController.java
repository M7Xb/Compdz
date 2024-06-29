package dz.isil.l3.ecom.controller;

import dz.isil.l3.ecom.service.Emailsubscribe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SubscriptionController {
    @Autowired
    private Emailsubscribe emailService;

    @PostMapping("/subscribe")
    public String handleSubscription(@RequestParam("email") String userEmail, RedirectAttributes redirectAttributes) {

        try {
            emailService.sendSimpleMessage(userEmail, "CompDz",
                    "Hello! Thank you for subscribing to our website. Stay tuned for updates.");
            redirectAttributes.addFlashAttribute("message", "Subscribed successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Failed to subscribe: " + e.getMessage());
        }
        return "redirect:/";
    }
}