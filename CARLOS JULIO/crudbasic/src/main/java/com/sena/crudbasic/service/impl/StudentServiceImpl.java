package com.sena.crudbasic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sena.crudbasic.Model.Student;
import com.sena.crudbasic.dto.StudentDto;
import com.sena.crudbasic.repository.StudentRepository;
import com.sena.crudbasic.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService{

    @Autowired
    private StudentRepository repo;

    @Override
    public List<Student> findAll(){
        return this.repo.findAll();
    }

    @Override
    public Student findById(int id){
        return repo.findById(id).orElse(null);
    }

    @Override
    public List<Student> filterByFullName(String name){
        return repo.filterByFullName(name);
    }

    public Student dtoToModel(StudentDto studentDto){
        return new Student(
        studentDto.getId(),
        studentDto.getFull_name()
        );
    }

    public Student modelToDto(Student student){
        return new Student(
        student.getId(),
        student.getFull_name()
        );
    }

    @Override
    public String save(StudentDto studentDto){
        Student student = dtoToModel(studentDto);
        repo.save(student);
        return "Student guardado correctamente";
    }

    @Override
    public String delete(int id){
        repo.deleteById(id);
        return null;
    }
}