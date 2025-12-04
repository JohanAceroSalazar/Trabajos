package com.sena.crudbasic.dto;

import com.sena.crudbasic.Model.Role;
import com.sena.crudbasic.Model.User;

public class User_RoleDto {

    private int id;
    private User user;
    private Role role;

    public User_RoleDto(int id, User user, Role role) {
        this.id = id;
        this.user = user;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}