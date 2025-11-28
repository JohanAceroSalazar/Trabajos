package com.sena.crudbasic.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.sena.crudbasic.service.EnrollmentService;
import com.sena.crudbasic.Model.Enrollment;
import com.sena.crudbasic.dto.EnrollmentDto;
import com.sena.crudbasic.repository.EnrollmentRepository;

@Service
public class EnrollmentServiceImpl
implements EnrollmentService{
    @Autowired
	private EnrollmentRepository repo;

	@Override
	public List<Enrollment> findAll() {
		
		return this.repo.findAll();
	}

	@Override
	public Enrollment findById(int id) {
		return repo.findById(id).orElse(null);
	}

	@Override
	public List<Enrollment> filterByDate(String date) {
		return repo.filterByDate(date);
	}
	//conversor del DTO al model
	public Enrollment dtoToModel(EnrollmentDto enrollmentDto) {
		return new Enrollment
				(
				enrollmentDto.getId(),
				enrollmentDto.getEnrollment_date(),
				enrollmentDto.getCourse(),
				enrollmentDto.getStudent()
		);
	}

	public EnrollmentDto modelToDto(Enrollment enrollment) {
		return new EnrollmentDto(
				enrollment.getId(),
				enrollment.getEnrollment_date(),
				enrollment.getCourse(),
				enrollment.getStudent()
				);
	}

	@Override
	public String save(EnrollmentDto enrollmentDto) {
		Enrollment enrollment=dtoToModel(enrollmentDto);
		repo.save(enrollment);
		return "Inscripcion guardada exitosamente";
	}

	@Override
	public String delete(int id) {
		repo.deleteById(id);
		return null;
	}
}