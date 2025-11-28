package com.sena.crudbasic.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.HttpStatus;
import com.sena.crudbasic.Model.Enrollment;
import com.sena.crudbasic.dto.EnrollmentDto;
import com.sena.crudbasic.service.EnrollmentService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/enrollments")
public class EnrollmentController {

    @Autowired
    private EnrollmentService service;

    @GetMapping("")
    public ResponseEntity<Object> findAll(){
        return new ResponseEntity<Object>(
            service.findAll(),HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<Object>save(
        @RequestBody EnrollmentDto e){
        service.save(e);
        return new ResponseEntity<Object>
        ("Se guardó correctamente",HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Object>findById(
        @PathVariable int id){
            Enrollment enrollment=service.findById(id);
            return new ResponseEntity<Object>
            (enrollment,HttpStatus.OK);
        }

    @GetMapping("filterbydate/{date}")
    public ResponseEntity<Object>filterByDate(
        @PathVariable String date){
            List <Enrollment> enrollment=service.filterByDate(date);
            return new ResponseEntity<Object>
            (enrollment,HttpStatus.OK);
        }

    @DeleteMapping("{id}")
    public ResponseEntity<Object>delete(
        @PathVariable int id){
            service.delete(id);
            return new ResponseEntity<Object>
            ("Se elimino correctamente", HttpStatus.OK);
        }
}