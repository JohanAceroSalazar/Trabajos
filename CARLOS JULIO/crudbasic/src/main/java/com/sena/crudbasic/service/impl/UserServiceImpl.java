package com.sena.crudbasic.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sena.crudbasic.Model.User;
import com.sena.crudbasic.dto.UserDto;
import com.sena.crudbasic.repository.UserRepository;
import com.sena.crudbasic.service.UserService;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository repo;

    @Override
    public List<User> findAll(){
        return this.repo.findAll();
    }

    @Override
    public User findById(int id){
        return repo.findById(id).orElse(null);
    }

    @Override
    public List<User> filterByName(String name){
        return repo.filterByName(name);
    }

    public User dtoToModel(UserDto UserDto){
        return new User(
        UserDto.getId(),
        UserDto.getName(),
        UserDto.getStudent()
        );
    }

    public User modelToDto(User User){
        return new User(
        User.getId(),
        User.getName(),
        User.getStudent()
        );
    }

    @Override
    public String save(UserDto UserDto){
        User User = dtoToModel(UserDto);
        repo.save(User);
        return "User guardado correctamente";
    }

    @Override
    public String delete(int id){
        repo.deleteById(id);
        return null;
    }
}