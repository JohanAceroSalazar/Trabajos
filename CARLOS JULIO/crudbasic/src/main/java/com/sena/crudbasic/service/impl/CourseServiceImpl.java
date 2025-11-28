package com.sena.crudbasic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sena.crudbasic.dto.CourseDto;
import com.sena.crudbasic.Model.Course;
import com.sena.crudbasic.repository.CourseRepository;
import com.sena.crudbasic.service.CourseService;

@Service
public class CourseServiceImpl
implements CourseService{
	
	@Autowired
	private CourseRepository repo;

	@Override
	public List<Course> findAll() {
		
		return this.repo.findAll();
	}

	@Override
	public Course findById(int id) {
		return repo.findById(id).orElse(null);
	}

	@Override
	public List<Course> filterByTitle(String title) {
		return repo.filterByTitle(title);
	}
	//conversor del DTO al model
	public Course dtoToModel(CourseDto courseDto) {
		return new Course
				(
				courseDto.getId(),
				courseDto.getTitle()
		);
	}
	public CourseDto modelToDto(Course course) {
		return new CourseDto(
				course.getId(),
				course.getTitle()
				);
	}

	@Override
	public String save(CourseDto courseDto) {
		Course course=dtoToModel(courseDto);
		repo.save(course);
		return "Curso guardado exitosamente";
	}

	@Override
	public String delete(int id) {
		repo.deleteById(id);
		return null;
	}
}