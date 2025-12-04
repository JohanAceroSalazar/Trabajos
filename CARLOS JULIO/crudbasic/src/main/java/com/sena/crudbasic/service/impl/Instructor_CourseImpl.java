package com.sena.crudbasic.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sena.crudbasic.Model.Instructor_Course;
import com.sena.crudbasic.dto.Instructor_CourseDto;
import com.sena.crudbasic.repository.Instructor_CourseRepository;
import com.sena.crudbasic.service.Instructor_CourseService;

@Service
public class Instructor_CourseImpl implements Instructor_CourseService{

    @Autowired
    private Instructor_CourseRepository repo;

    @Override
    public List<Instructor_Course> findAll(){
        return this.repo.findAll();
    }

    @Override
    public Instructor_Course findById(int id){
        return repo.findById(id).orElse(null);
    }

    @Override
    public List<Instructor_Course> filterById(int id){
        return repo.filterById(id);
    }

    public Instructor_Course dtoToModel(Instructor_CourseDto instructor_coursedto){
        return new Instructor_Course(
            instructor_coursedto.getId(),
            instructor_coursedto.getInstructor(),
            instructor_coursedto.getCourse()
        );
    }

    public Instructor_CourseDto modelToDto(Instructor_Course instructor_course){
        return new Instructor_CourseDto(
            instructor_course.getId(),
            instructor_course.getInstructor(),
            instructor_course.getCourse()
        );
    }

    @Override
    public String save(Instructor_CourseDto instructor_courseDto) {
		Instructor_Course instructor_course=dtoToModel(instructor_courseDto);
		repo.save(instructor_course);
		return "Inscripcion guardada exitosamente";
	}

    @Override
    public String delete(int id) {
		repo.deleteById(id);
		return null;
	}
}