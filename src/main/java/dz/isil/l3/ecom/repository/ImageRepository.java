package dz.isil.l3.ecom.repository;

import dz.isil.l3.ecom.entity.Images;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<Images, Long> {
}