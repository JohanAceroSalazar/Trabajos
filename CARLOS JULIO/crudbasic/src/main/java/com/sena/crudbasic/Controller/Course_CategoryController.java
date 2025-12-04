package com.sena.crudbasic.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sena.crudbasic.Model.Course_Category;
import com.sena.crudbasic.dto.Course_CategoryDto;
import com.sena.crudbasic.service.Course_CategoryService;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/cou_cat")
public class Course_CategoryController {

    @Autowired
    private Course_CategoryService service;

    @GetMapping("")
    public ResponseEntity<Object> findAll(){
        return new ResponseEntity<Object>(
            service.findAll(),HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<Object>save(
        @RequestBody Course_CategoryDto c){
        service.save(c);
        return new ResponseEntity<Object>
        ("Se guardó correctamente",HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Object> findById(
        @PathVariable int id){
            Course_Category course_category = service.findById(id);
            return new ResponseEntity<Object>
            (course_category,HttpStatus.OK);
        }

    @GetMapping("filterbyid/{id}")
    public ResponseEntity<Object>filterById(
        @PathVariable int id){
            List <Course_Category> course_category = service.filterById(id);
            return new ResponseEntity<Object>
            (course_category,HttpStatus.OK);
        }

    @DeleteMapping("{id}")
    public ResponseEntity<Object>delete(
        @PathVariable int id){
            service.delete(id);
            return new ResponseEntity<Object>
            ("Se elimino correctamente", HttpStatus.OK);
        }
}