package com.sena.crudbasic.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.List;

@Entity(name = "instructor")
public class Instructor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_instructor")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "specialty")
    private String specialty;

    @OneToMany(mappedBy = "instructor")
    private List<Instructor_Course> courses;
}