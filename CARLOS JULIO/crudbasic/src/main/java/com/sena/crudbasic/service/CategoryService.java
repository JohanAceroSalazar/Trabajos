package com.sena.crudbasic.service;

import java.util.List;

import com.sena.crudbasic.Model.Category;
import com.sena.crudbasic.dto.CategoryDto;

public interface CategoryService {

    /*
	 * findAll: buscar todo
	 * findById: buscar por id
	 * filterByName: filtrar por nombre de categoria
	 * save: guardar
	 * delete: eliminar
	 */
	public List<Category> findAll();
	public Category findById(int id);
	public List<Category> filterByNameCategories(String title);
	public String save(CategoryDto c);
	public String delete(int id);
}