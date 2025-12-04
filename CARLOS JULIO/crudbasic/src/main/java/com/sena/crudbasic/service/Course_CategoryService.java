package com.sena.crudbasic.service;

import java.util.List;
import com.sena.crudbasic.Model.Course_Category;
import com.sena.crudbasic.dto.Course_CategoryDto;

public interface Course_CategoryService {

    public List<Course_Category> findAll();
	public Course_Category findById(int id);
	public List<Course_Category> filterById(int id);
	public String save(Course_CategoryDto c);
	public String delete(int id);
}