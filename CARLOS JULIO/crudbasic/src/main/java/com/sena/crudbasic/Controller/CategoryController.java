package com.sena.crudbasic.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import com.sena.crudbasic.dto.CategoryDto;
import com.sena.crudbasic.service.CategoryService;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.sena.crudbasic.Model.Category;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RequestMapping("/category")
public class CategoryController {

    @Autowired
	private CategoryService service;

    @GetMapping("")
    public ResponseEntity<Object>findAll(){
        return new ResponseEntity<Object>(
            service.findAll(),HttpStatus.OK);
    }
    

    @PostMapping("")
    public ResponseEntity<Object>save(
            @RequestBody CategoryDto c){
        service.save(c);
        return new ResponseEntity<Object>
        ("Se guardó correctamente",HttpStatus.OK);
        }
    
    @GetMapping("{id}")
    public ResponseEntity<Object>findById(
        @PathVariable int id){
            Category category = service.findById(id);
            return new ResponseEntity<Object>
            (category,HttpStatus.OK);
    }

    @GetMapping("filterbyname/{name}")
	public ResponseEntity<Object>filterByNameCategories( 
			@PathVariable String name){
		List <Category> category=service.filterByNameCategories(name);
	return new ResponseEntity<Object>
	(category,HttpStatus.OK);
	
	}
	@DeleteMapping("{id}")
	public ResponseEntity<Object>delete(
			@PathVariable int id){
		service.delete(id);
		return new ResponseEntity<Object>
		("Se eliminó",HttpStatus.OK);
	}
}