package com.sena.crudbasic.service;

import java.util.List;

import com.sena.crudbasic.Model.Enrollment;
import com.sena.crudbasic.dto.EnrollmentDto;

public interface EnrollmentService {

    /*
	 * findAll: buscar todo
	 * findById: buscar por id
	 * filterByName: filtrar por nombre de categoria
	 * save: guardar
	 * delete: eliminar
	 */
	public List<Enrollment> findAll();
	public Enrollment findById(int id);
	public List<Enrollment> filterByDate(String date);
	public String save(EnrollmentDto c);
	public String delete(int id);
}