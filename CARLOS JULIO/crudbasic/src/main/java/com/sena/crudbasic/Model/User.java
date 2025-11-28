package com.sena.crudbasic.Model;


import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;

@Entity(name="users")
public class User {

	@Id
	//anotación para autoincremental
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	//indicar que el campo es una columna
	@Column(name="id_User")
	private int id;

    @Column(name="name")
    private String name;

	@OneToMany(mappedBy = "user")
    private List<User_Role> roles;

	@OneToOne
	@JoinColumn(name = "id_student")  //FK en la tabla User
	private Student student;

	public User() {
	}

	public User(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}