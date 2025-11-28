package com.sena.crudbasic.service;

import java.util.List;
import com.sena.crudbasic.Model.Instructor;
import com.sena.crudbasic.dto.InstructorDto;

public interface InstructorService {

    public List<Instructor> findAll();
	public Instructor findById(int id);
	public List<Instructor> filterBySpecialty(String specialty);
	public String save(InstructorDto i);
	public String delete(int id);
}