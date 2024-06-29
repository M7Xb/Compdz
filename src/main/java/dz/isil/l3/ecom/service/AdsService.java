package dz.isil.l3.ecom.service;
import dz.isil.l3.ecom.entity.Ads;
import dz.isil.l3.ecom.repository.AdsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class AdsService {

    @Autowired
    private AdsRepository adsRepository;

    public void saveAds(Ads ads) {
        adsRepository.save(ads);
    }
    public List<Ads> getAllAds() {
        return adsRepository.findAll();
    }

    public void deleteAdsById(Long id) {
        adsRepository.deleteById(id);
    }
    public Ads getAdsById(Long id) {
        Optional<Ads> optionalAds = adsRepository.findById(id);
        return optionalAds.orElse(null);
    }
}
