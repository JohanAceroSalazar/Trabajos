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

@Entity(name="[User]")
public class User {

    //anotación bean para id de la entidad
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
}