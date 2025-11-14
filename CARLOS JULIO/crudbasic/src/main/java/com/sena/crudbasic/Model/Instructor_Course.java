package com.sena.crudbasic.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.GenerationType;

@Entity(name = "instructor_course")
public class Instructor_Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_Instructor_course")
    private int id;

    @ManyToOne
    @JoinColumn(name = "id_instructor")
    private Instructor instructor;

    @ManyToOne
    @JoinColumn(name = "id_course")
    private Course course;
}