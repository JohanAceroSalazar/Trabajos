package com.sena.crudbasic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sena.crudbasic.Model.Instructor;
import com.sena.crudbasic.dto.InstructorDto;
import com.sena.crudbasic.repository.InstructorRepository;
import com.sena.crudbasic.service.InstructorService;

@Service
public class InstructorServiceImpl 
implements InstructorService{

    @Autowired
    private InstructorRepository repo;

    @Override
    public List<Instructor> findAll(){
        return this.repo.findAll();
    }

    @Override
    public Instructor findById(int id){
        return repo.findById(id).orElse(null);
    }

    @Override
    public List<Instructor> filterBySpecialty(String specialty){
        return repo.filterBySpecialty(specialty);
    }

    public Instructor dtoToModel(InstructorDto instructorDto){
        return new Instructor(
        instructorDto.getId(),
        instructorDto.getName(),
        instructorDto.getSpecialty()
        );
    }

    public Instructor modelToDto(Instructor instructor){
        return new Instructor(
        instructor.getId(),
        instructor.getName(),
        instructor.getSpecialty()
        );
    }

    @Override
    public String save(InstructorDto instructorDto){
        Instructor instructor = dtoToModel(instructorDto);
        repo.save(instructor);
        return "Instructor guardado correctamente";
    }

    @Override
    public String delete(int id){
        repo.deleteById(id);
        return null;
    }
}