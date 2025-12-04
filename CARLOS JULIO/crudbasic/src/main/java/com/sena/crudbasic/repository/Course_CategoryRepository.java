package com.sena.crudbasic.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.sena.crudbasic.Model.Course_Category;

@Repository
public interface Course_CategoryRepository extends JpaRepository<Course_Category, Integer>{

    @Query(""
			+ "SELECT "
			+ "c "
			+ "FROM "
			+ "course_category c "
			+ "WHERE "
			+ "c.id = ?1"
			)
	public List<Course_Category>filterById(int id);
}