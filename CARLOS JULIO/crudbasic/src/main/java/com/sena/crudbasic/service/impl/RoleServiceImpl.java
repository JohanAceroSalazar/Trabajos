package com.sena.crudbasic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sena.crudbasic.Model.Role;
import com.sena.crudbasic.dto.RoleDto;
import com.sena.crudbasic.repository.RoleRepository;
import com.sena.crudbasic.service.RoleService;

@Service
public class RoleServiceImpl 
implements RoleService {

    @Autowired
    private RoleRepository repo;

    @Override
    public List<Role> findAll(){
        return this.repo.findAll();
    }

    @Override
    public Role findById(int id){
        return repo.findById(id).orElse(null);
    }

    @Override
    public List<Role> filterByName(String name){
        return repo.filterByName(name);
    }

    public Role dtoToModel(RoleDto roleDto){
        return new Role(
        roleDto.getId(),
        roleDto.getName()
        );
    }

    public Role modelToDto(Role role){
        return new Role(
        role.getId(),
        role.getName()
        );
    }

    @Override
    public String save(RoleDto RoleDto){
        Role role = dtoToModel(RoleDto);
        repo.save(role);
        return "Role guardado correctamente";
    }

    @Override
    public String delete(int id){
        repo.deleteById(id);
        return null;
    }
}