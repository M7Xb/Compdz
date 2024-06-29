package dz.isil.l3.ecom.service;

import dz.isil.l3.ecom.entity.DealProduct;
import dz.isil.l3.ecom.repository.DealProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class DealProductService {

    @Autowired
    private DealProductRepository dealProductRepository;

    public void saveDealProduct(DealProduct dealProduct) {
        dealProductRepository.save(dealProduct);
    }

    public List<DealProduct> getAllDealProducts() {
        return dealProductRepository.findAll();
    }

    public DealProduct getDealProductById(Long id) {
        return dealProductRepository.findById(id).orElseThrow(() -> new RuntimeException("deal not found"));
    }

    public void deleteDealProduct(Long id) {
        dealProductRepository.deleteById(id);
    }
    public void setEndTime(Long id, LocalDateTime endTime) {
        DealProduct dealProduct = getDealProductById(id);
        if (dealProduct != null) {
            dealProduct.setEndTime(endTime);
            saveDealProduct(dealProduct);
        }
    }
}
