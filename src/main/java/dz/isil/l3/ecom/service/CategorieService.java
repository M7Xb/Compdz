package dz.isil.l3.ecom.service;

import dz.isil.l3.ecom.entity.Category;
import dz.isil.l3.ecom.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategorieService {

    @Autowired
    private CategoryRepository categoryRepos;

    public List<Category> getAllCategories() {
        return categoryRepos.findAll();
    }

    public Category getCategorieById(Integer idCategorie) {
        return categoryRepos.getOne(idCategorie);
    }

    public Category ajouterProduit(Category category) {
        return categoryRepos.save(category);

    }
    public void deleteCategoryById(Integer categoryId) {
        categoryRepos.deleteById(categoryId);
    }
    public void updateCategory(Category category) {
        categoryRepos.save(category);
    }

}
