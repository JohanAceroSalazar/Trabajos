package com.sena.crudbasic.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.sena.crudbasic.Model.Instructor_Course;

@Repository
public interface Instructor_CourseRepository extends JpaRepository<Instructor_Course, Integer>{

    @Query(""
			+ "SELECT "
			+ "i "
			+ "FROM "
			+ "instructor_course i "
			+ "WHERE "
			+ "i.id = ?1"
			)
	public List<Instructor_Course>filterById(int id);
}