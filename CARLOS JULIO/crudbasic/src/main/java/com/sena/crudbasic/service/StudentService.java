package com.sena.crudbasic.service;

import java.util.List;
import com.sena.crudbasic.Model.Student;
import com.sena.crudbasic.dto.StudentDto;

public interface StudentService {

    public List<Student> findAll();
	public Student findById(int id);
	public List<Student> filterByFullName(String full_name);
	public String save(StudentDto s);
	public String delete(int id);
}