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

import com.sena.crudbasic.Model.User_Role;
import com.sena.crudbasic.dto.User_RoleDto;
import com.sena.crudbasic.service.User_RoleService;

@RestController
@RequestMapping("/use_rol")
public class User_RoleController {

    @Autowired
    private User_RoleService service;

    @GetMapping("")
    public ResponseEntity<Object> findAll(){
        return new ResponseEntity<Object>(
            service.findAll(),HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<Object>save(
        @RequestBody User_RoleDto u){
        service.save(u);
        return new ResponseEntity<Object>
        ("Se guardó correctamente",HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Object> findById(
        @PathVariable int id){
            User_Role user_role = service.findById(id);
            return new ResponseEntity<Object>
            (user_role,HttpStatus.OK);
        }

    @GetMapping("filterbyid/{id}")
    public ResponseEntity<Object>filterById(
        @PathVariable int id){
            List <User_Role> user_role = service.filterById(id);
            return new ResponseEntity<Object>
            (user_role,HttpStatus.OK);
        }

    @DeleteMapping("{id}")
    public ResponseEntity<Object>delete(
        @PathVariable int id){
            service.delete(id);
            return new ResponseEntity<Object>
            ("Se elimino correctamente", HttpStatus.OK);
        }
}