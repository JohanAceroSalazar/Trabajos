package com.sena.crudbasic.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sena.crudbasic.Model.Instructor_Course;
import com.sena.crudbasic.dto.Instructor_CourseDto;
import com.sena.crudbasic.service.Instructor_CourseService;

@RestController
@RequestMapping("/ins_cou")
public class Instructor_CourseController {

    @Autowired
    private Instructor_CourseService service;

    @GetMapping("")
    public ResponseEntity<Object> findAll(){
        return new ResponseEntity<Object>(
            service.findAll(),HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<Object>save(
        @RequestBody Instructor_CourseDto i){
        service.save(i);
        return new ResponseEntity<Object>
        ("Se guardó correctamente",HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Object> findById(
        @PathVariable int id){
            Instructor_Course instructor_course = service.findById(id);
            return new ResponseEntity<Object>
            (instructor_course,HttpStatus.OK);
        }

    @GetMapping("filterbyid/{id}")
    public ResponseEntity<Object>filterById(
        @PathVariable int id){
            List <Instructor_Course> instructor_course = service.filterById(id);
            return new ResponseEntity<Object>
            (instructor_course,HttpStatus.OK);
        }

    @DeleteMapping("{id}")
    public ResponseEntity<Object>delete(
        @PathVariable int id){
            service.delete(id);
            return new ResponseEntity<Object>
            ("Se elimino correctamente", HttpStatus.OK);
        }
}