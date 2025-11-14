package com.sena.crudbasic.Model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity(name="role")
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_role")
	private int id;

    @Column(name="role_name")
    private String name;

    @OneToMany(mappedBy = "role")
    private List<User_Role> users;
}