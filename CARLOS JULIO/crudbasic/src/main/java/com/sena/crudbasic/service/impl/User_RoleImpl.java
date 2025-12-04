package com.sena.crudbasic.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sena.crudbasic.Model.User_Role;
import com.sena.crudbasic.dto.User_RoleDto;
import com.sena.crudbasic.repository.User_RoleRepository;
import com.sena.crudbasic.service.User_RoleService;

@Service
public class User_RoleImpl implements User_RoleService{

    @Autowired
    private User_RoleRepository repo;

    @Override
    public List<User_Role> findAll(){
        return this.repo.findAll();
    }

    @Override
    public User_Role findById(int id){
        return repo.findById(id).orElse(null);
    }

    @Override
    public List<User_Role> filterById(int id){
        return repo.filterById(id);
    }

    public User_Role dtoToModel(User_RoleDto user_roledto){
        return new User_Role(
            user_roledto.getId(),
            user_roledto.getUser(),
            user_roledto.getRole()
        );
    }

    public User_RoleDto modelToDto(User_Role user_role){
        return new User_RoleDto(
            user_role.getId(),
            user_role.getUser(),
            user_role.getRole()
        );
    }

    @Override
    public String save(User_RoleDto User_RoleDto) {
		User_Role user_role=dtoToModel(User_RoleDto);
		repo.save(user_role);
		return "Inscripcion guardada exitosamente";
	}

    @Override
    public String delete(int id) {
		repo.deleteById(id);
		return null;
	}
}