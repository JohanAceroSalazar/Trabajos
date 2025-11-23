package com.sena.crudbasic.Model;

import java.math.BigDecimal;
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

    @Column(name="price")
    private BigDecimal price;

    
    @OneToMany(mappedBy = "course")
    private List<Course_Category> categories;

    @OneToMany(mappedBy = "course")
    private List<Instructor_Course> instructors;

    @OneToMany(mappedBy = "course")
    private List<Enrollment> enrollments;

    public Course(){
    }

    public Course(int id, String title, BigDecimal price) {
        this.id = id;
        this.title = title;
        this.price = price;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}