package com.sena.crudbasic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.sena.crudbasic.Model.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer>{

    @Query(""
			+ "SELECT "
			+ "r "
			+ "FROM "
			+ "role r "
			+ "WHERE "
			+ "r.name like %?1%"
			)
	public List<Role>filterByName(String name);
}