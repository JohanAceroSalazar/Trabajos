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
import com.sena.crudbasic.Model.User;
import com.sena.crudbasic.dto.UserDto;
import com.sena.crudbasic.service.UserService;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService service;

    @GetMapping("")
    public ResponseEntity<Object> findAll(){
        return new ResponseEntity<Object>(
            service.findAll(),HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<Object> save(
    @RequestBody UserDto u){
        service.save(u);
        return new ResponseEntity<Object>
        ("Se guardo exitosamente",HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Object> findById(
    @PathVariable int id){
        User user = service.findById(id);
        return new ResponseEntity<Object>
        (user,HttpStatus.OK);
    }

    @GetMapping("filterbyname/{name}")
    public ResponseEntity<Object>filterByName(
        @PathVariable String name){
            List<User> user=service.filterByName(name);
            return new ResponseEntity<Object>
            (user,HttpStatus.OK);
        }

    @DeleteMapping("{id}")
    public ResponseEntity<Object>delete(
        @PathVariable int id){
            service.delete(id);
            return new ResponseEntity<Object>
            ("Se elimino correctamente", HttpStatus.OK);
        }
}
