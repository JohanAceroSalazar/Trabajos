package com.sena.crudbasic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.sena.crudbasic.Model.Instructor;

@Repository
public interface InstructorRepository 
extends JpaRepository<Instructor, Integer> {

    @Query(""
			+ "SELECT "
			+ "i "
			+ "FROM "
			+ "instructor i "
			+ "WHERE "
			+ "i.specialty like %?1%"
			)
	public List<Instructor>filterBySpecialty(String specialty);
}