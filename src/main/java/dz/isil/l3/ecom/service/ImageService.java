package dz.isil.l3.ecom.service;
import dz.isil.l3.ecom.entity.Images;
import dz.isil.l3.ecom.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class ImageService {
    @Autowired
    private ImageRepository imageRepository;

    public void saveImage(String name, MultipartFile file) throws IOException {
        Images image = new Images();
        image.setName(name);
        image.setImage(file.getBytes());
        imageRepository.save(image);
    }
    public List<Images> getAllImages() {
        return imageRepository.findAll();
    }
    public Images getImageById(int id) {
        return imageRepository.findById((long) id).orElseThrow(() -> new RuntimeException("Image not found"));
    }
    public void deleteImageById(int id) {
        imageRepository.deleteById((long) id);
    }


}

