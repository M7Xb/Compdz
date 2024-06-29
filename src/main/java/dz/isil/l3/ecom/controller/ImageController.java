package dz.isil.l3.ecom.controller;


import dz.isil.l3.ecom.entity.Images;
import dz.isil.l3.ecom.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
public class ImageController {
    @Autowired
    private ImageService imageService;



    @PostMapping("/upload")
    public String handleFileUpload(@RequestParam("name") String name, @RequestParam("file") MultipartFile file, Model model) {
        try {
            imageService.saveImage(name, file);
            model.addAttribute("message", "File uploaded successfully!");
        } catch (IOException e) {
            model.addAttribute("message", "File upload failed: " + e.getMessage());
        }
        List<Images> images = imageService.getAllImages();
        model.addAttribute("images", images);

        return "redirect:/admin";
    }

    @GetMapping("/images/image/{id}")
    public ResponseEntity<byte[]> getImage(@PathVariable("id") Long id) {
        Images image = imageService.getImageById(Math.toIntExact(id));
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + image.getName() + "\"")
                .contentType(MediaType.IMAGE_JPEG)
                .body(image.getImage());
    }
    @GetMapping("/images/delete/{id}")
    public String deleteImage(@PathVariable("id") int id, Model model) {
        imageService.deleteImageById(id);
        model.addAttribute("message", "Image deleted successfully!");
        List<Images> images = imageService.getAllImages();
        model.addAttribute("imagesList", images);
        return "redirect:/admin";
    }

}

