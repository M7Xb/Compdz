package dz.isil.l3.ecom.controller;

import dz.isil.l3.ecom.entity.Ads;
import dz.isil.l3.ecom.service.AdsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class AdsController {

    @Autowired
    private AdsService adsService;

    @PostMapping("/save-ads")
    public String saveAds(@ModelAttribute Ads ads) {
        adsService.saveAds(ads);
        return "redirect:/admin";
    }

    @GetMapping("/all-ads")
    public String listAds(Model model) {
        List<Ads> ads = adsService.getAllAds();
        model.addAttribute("Ads", ads);
        return "admin";
    }

    @GetMapping("/delete-ads/{id}")
    public String deleteAds(@PathVariable("id") Long adsId, RedirectAttributes redirectAttributes) {
        try {
            adsService.deleteAdsById(adsId);
            redirectAttributes.addFlashAttribute("successMessage", "Ads deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error deleting Ads.");
        }
        return "redirect:/admin";
    }


    @PostMapping("/edit-ads/{id}")
    public String editAds(@PathVariable("id") Long adsId,
                          @RequestParam("description") String description,
                          RedirectAttributes redirectAttributes) {
        Ads ads = adsService.getAdsById(adsId);
        if (ads != null) {
            ads.setDescription(description);
            adsService.saveAds(ads);
            redirectAttributes.addFlashAttribute("successMessage", "Ads updated successfully.");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Ads not found.");
        }
        return "redirect:/admin";
    }
}
