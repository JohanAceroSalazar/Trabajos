package com.sena.crudbasic.Model;

import java.util.List;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity(name="course")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_course")
    private int id;

    @Column(name="title")
    private String title;

    
    @OneToMany(mappedBy = "course")
    private List<Course_Category> categories;

    @OneToMany(mappedBy = "course")
    private List<Instructor_Course> instructors;

    @OneToMany(mappedBy = "course")
    private List<Enrollment> enrollments;

    public Course(){
    }

    public Course(int id, String title) {
        this.id = id;
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}