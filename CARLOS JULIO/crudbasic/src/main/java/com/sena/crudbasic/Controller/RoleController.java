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
import com.sena.crudbasic.Model.Role;
import com.sena.crudbasic.dto.RoleDto;
import com.sena.crudbasic.service.RoleService;

@RestController
@RequestMapping("/roles")
public class RoleController {

    @Autowired 
    private RoleService service;

    @GetMapping("")
    public ResponseEntity<Object> findAll(){
        return new ResponseEntity<Object>(
            service.findAll(),HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<Object> save(
    @RequestBody RoleDto r){
        service.save(r);
        return new ResponseEntity<Object>
        ("Se guardo exitosamente",HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Object> findById(
    @PathVariable int id){
        Role role = service.findById(id);
        return new ResponseEntity<Object>
        (role,HttpStatus.OK);
    }

    @GetMapping("filterbyname/{name}")
    public ResponseEntity<Object>filterByName(
        @PathVariable String name){
            List<Role> Role=service.filterByName(name);
            return new ResponseEntity<Object>
            (Role,HttpStatus.OK);
        }

    @DeleteMapping("{id}")
    public ResponseEntity<Object>delete(
        @PathVariable int id){
            service.delete(id);
            return new ResponseEntity<Object>
            ("Se elimino correctamente", HttpStatus.OK);
        }
}