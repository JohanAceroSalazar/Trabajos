package com.sena.crudbasic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.sena.crudbasic.Model.Category;

@Repository
public interface CategoryRepository 
extends JpaRepository<Category, Integer> {

    @Query(""
			+ "SELECT "
			+ "c "
			+ "FROM "
			+ "category c "
			+ "WHERE "
			+ "c.name_category like %?1%"
			)
	public List<Category>filterByNameCategories(String name_category);
}
