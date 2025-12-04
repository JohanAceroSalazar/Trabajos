package com.sena.crudbasic.service;

import java.util.List;
import com.sena.crudbasic.Model.Instructor_Course;
import com.sena.crudbasic.dto.Instructor_CourseDto;

public interface Instructor_CourseService {

    public List<Instructor_Course> findAll();
	public Instructor_Course findById(int id);
	public List<Instructor_Course> filterById(int id);
	public String save(Instructor_CourseDto c);
	public String delete(int id);
}