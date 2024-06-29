package dz.isil.l3.ecom.controller;

import dz.isil.l3.ecom.entity.DealProduct;
import dz.isil.l3.ecom.entity.Images;
import dz.isil.l3.ecom.service.DealProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class DealProductController {

    @Autowired
    private DealProductService dealProductService;



    @PostMapping("/dealproducts/save")
    public String saveDealProduct(@ModelAttribute DealProduct dealProduct,
                                  @RequestParam("imageFile") MultipartFile imageFile,

                                  Model model) {
        try {
            dealProduct.setImage(imageFile.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        List<DealProduct> dealProducts = dealProductService.getAllDealProducts();
        model.addAttribute("dealProducts", dealProducts);
        dealProductService.saveDealProduct(dealProduct);
        return "redirect:/admin";
    }


    @GetMapping("/deals/image/{id}")
    public ResponseEntity<byte[]> getImage(@PathVariable("id") Long id) {
        DealProduct image = dealProductService.getDealProductById(id);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + image.getName() + "\"")
                .contentType(MediaType.IMAGE_JPEG)
                .body(image.getImage());
    }

    @GetMapping("/deleteDeal/{id}")

    public String deleteDeal(@PathVariable("id") Integer DealId, RedirectAttributes redirectAttributes) {
        try {
            dealProductService.deleteDealProduct(Long.valueOf(DealId));
            redirectAttributes.addFlashAttribute("successMessage", "deal deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error deleting deal. ");
        }
        return "redirect:/admin";
    }

    @PostMapping("/dealproducts/setEndDeal/{id}")
    public String setEndDeal(@PathVariable("id") Long id,
                             @RequestParam("endTime") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endTime ){

        dealProductService.setEndTime(id, endTime);
        return "redirect:/admin";
    }


    @PostMapping("/dealproducts/edit/{id}")
    public String editDealProduct(@PathVariable("id") Long dealProductId,
                                  @RequestParam("name") String name,
                                  @RequestParam("description") String description,
                                  @RequestParam("oldPrice") Double oldPrice,
                                  @RequestParam("newPrice") Double newPrice,
                                  @RequestParam("endTime") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endTime,
                                  @RequestParam("imageFile") MultipartFile imageFile,
                                  RedirectAttributes redirectAttributes) {
        DealProduct dealProduct = dealProductService.getDealProductById(dealProductId);
        if (dealProduct != null) {
            dealProduct.setName(name);
            dealProduct.setDescription(description);
            dealProduct.setOldPrice(oldPrice);
            dealProduct.setNewPrice(newPrice);
            dealProduct.setEndTime(endTime);
            if (!imageFile.isEmpty()) {
                try {
                    dealProduct.setImage(imageFile.getBytes());
                } catch (IOException e) {
                    redirectAttributes.addFlashAttribute("errorMessage", "Failed to upload image.");
                    return "redirect:/admin";
                }
            }
            dealProductService.saveDealProduct(dealProduct);
            redirectAttributes.addFlashAttribute("successMessage", "Deal product has been updated successfully.");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Deal product not found.");
        }
        return "redirect:/admin";
    }

}

