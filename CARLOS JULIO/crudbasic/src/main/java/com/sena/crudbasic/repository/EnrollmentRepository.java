package com.sena.crudbasic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.sena.crudbasic.Model.Enrollment;

@Repository
public interface EnrollmentRepository 
extends JpaRepository<Enrollment, Integer>{
    /*JpaRepository
     * Incluye las consultas basicas
     * Para una consulta personalizada
     * es requerido definir el método  necesario
     */

    @Query(""
			+ "SELECT "
			+ "e "
			+ "FROM "
			+ "enrollment e "
			+ "WHERE "
			+ "e.enrollment_date like %?1%"
			)
	public List<Enrollment>filterByDate(String date);
}