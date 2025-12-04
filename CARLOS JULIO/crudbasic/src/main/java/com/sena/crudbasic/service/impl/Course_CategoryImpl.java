package com.sena.crudbasic.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sena.crudbasic.Model.Course_Category;
import com.sena.crudbasic.dto.Course_CategoryDto;
import com.sena.crudbasic.repository.Course_CategoryRepository;
import com.sena.crudbasic.service.Course_CategoryService;

@Service
public class Course_CategoryImpl implements Course_CategoryService{

    @Autowired
    private Course_CategoryRepository repo;

    @Override
    public List<Course_Category> findAll(){
        return this.repo.findAll();
    }

    @Override
    public Course_Category findById(int id){
        return repo.findById(id).orElse(null);
    }

    @Override
    public List<Course_Category> filterById(int id){
        return repo.filterById(id);
    }

    public Course_Category dtoToModel(Course_CategoryDto course_categorydto){
        return new Course_Category(
            course_categorydto.getId(),
            course_categorydto.getCategory(),
            course_categorydto.getCourse()
        );
    }

    public Course_CategoryDto modelToDto(Course_Category course_category){
        return new Course_CategoryDto(
            course_category.getId(),
            course_category.getCategory(),
            course_category.getCourse()
        );
    }

    @Override
    public String save(Course_CategoryDto course_CategoryDto) {
		Course_Category course_category=dtoToModel(course_CategoryDto);
		repo.save(course_category);
		return "Inscripcion guardada exitosamente";
	}

    @Override
    public String delete(int id) {
		repo.deleteById(id);
		return null;
	}
}