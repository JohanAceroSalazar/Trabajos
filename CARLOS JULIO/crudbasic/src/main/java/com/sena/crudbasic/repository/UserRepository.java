package com.sena.crudbasic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.sena.crudbasic.Model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query(""
			+ "SELECT "
			+ "u "
			+ "FROM "
			+ "users u "
			+ "WHERE "
			+ "u.name like %?1%"
			)
	public List<User>filterByName(String name);
}