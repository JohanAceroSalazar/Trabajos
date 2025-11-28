package com.sena.crudbasic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sena.crudbasic.repository.CategoryRepository;
import com.sena.crudbasic.Model.Category;
import com.sena.crudbasic.dto.CategoryDto;
import com.sena.crudbasic.service.CategoryService;

@Service
public class CategoryServiceImpl 
implements CategoryService{

    @Autowired
	private CategoryRepository repo;

    @Override
    public List<Category> findAll(){
        return this.repo.findAll();
    }

    @Override
    public Category findById(int id) {
        return repo.findById(id).orElse(null);
    }

    @Override
    public String save(CategoryDto categoryDto) {
        Category category = dtoToModel(categoryDto);
        repo.save(category);
        return "Categoría guardada exitosamente";
    }

    @Override
	public String delete(int id) {
		repo.deleteById(id);
		return null;
	}

    @Override
    public List<Category> filterByNameCategories(String name) {
        return repo.filterByNameCategories(name);
    }

    //Conversor de dto al model
    public Category dtoToModel(CategoryDto categoryDto){
        return new Category(
                categoryDto.getId(),
                categoryDto.getName_category()
        );
    }

    public CategoryDto modelToDto(Category category) {
		return new CategoryDto(
				category.getId(),
				category.getName_category()
				);
	}
}