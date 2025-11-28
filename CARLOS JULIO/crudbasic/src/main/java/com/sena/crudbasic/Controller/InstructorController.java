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
import com.sena.crudbasic.Model.Instructor;
import com.sena.crudbasic.service.InstructorService;
import com.sena.crudbasic.dto.InstructorDto;

@RestController
@RequestMapping("/instructors")
public class InstructorController {

    @Autowired
    private InstructorService service;

    @GetMapping("")
    public ResponseEntity<Object> findAll(){
        return new ResponseEntity<Object>(
            service.findAll(),HttpStatus.OK);
    }
    @PostMapping("")
    public ResponseEntity<Object> save(
        @RequestBody InstructorDto i){
        service.save(i);
        return new ResponseEntity<Object>
        ("Se guardó correctamente",HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Object>findById(
        @PathVariable int id){
            Instructor instructor=service.findById(id);
            return new ResponseEntity<Object>
            (instructor,HttpStatus.OK);
        }

    @GetMapping("filterbyspecialty/{specialty}")
    public ResponseEntity<Object>filterBySpecialty(
        @PathVariable String specialty){
            List<Instructor> instructor=service.filterBySpecialty(specialty);
            return new ResponseEntity<Object>
            (instructor,HttpStatus.OK);
        }

    @DeleteMapping("{id}")
    public ResponseEntity<Object>delete(
        @PathVariable int id){
            service.delete(id);
            return new ResponseEntity<Object>
            ("Se elimino correctamente", HttpStatus.OK);
        }
}