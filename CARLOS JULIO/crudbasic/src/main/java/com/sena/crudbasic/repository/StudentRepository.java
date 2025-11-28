package com.sena.crudbasic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.sena.crudbasic.Model.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer>{

    @Query(""
			+ "SELECT "
			+ "s "
			+ "FROM "
			+ "student s "
			+ "WHERE "
			+ "s.full_name like %?1%"
			)
	public List<Student>filterByFullName(String full_name);
}