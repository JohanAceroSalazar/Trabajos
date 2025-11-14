package com.sena.crudbasic.Model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;

@Entity(name = "student")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_student")
    private int id;

    @Column(name = "full_name")
    private String full_name;

    @Column(name = "age")
    private int age;

    @OneToMany(mappedBy = "student")
    private List<Enrollment> enrollments;

    @OneToOne(mappedBy = "student")
    private User user;
}