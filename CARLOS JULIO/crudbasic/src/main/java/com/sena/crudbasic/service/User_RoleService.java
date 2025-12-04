package com.sena.crudbasic.service;

import java.util.List;
import com.sena.crudbasic.Model.User_Role;
import com.sena.crudbasic.dto.User_RoleDto;

public interface User_RoleService {

    public List<User_Role> findAll();
	public User_Role findById(int id);
	public List<User_Role> filterById(int id);
	public String save(User_RoleDto c);
	public String delete(int id);
}