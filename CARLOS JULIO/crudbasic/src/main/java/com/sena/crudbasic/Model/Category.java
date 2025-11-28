package com.sena.crudbasic.Model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.OneToMany;

@Entity(name="category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_category")
    private int id;

    @Column(name="name_category")
    private String name_category;

    @OneToMany(mappedBy = "category")
    private List<Course_Category> courses;

    public Category() {
    }

    public Category(int id, String name_category) {
        this.id = id;
        this.name_category = name_category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName_category() {
        return name_category;
    }

    public void setName_category(String name_category) {
        this.name_category = name_category;
    }

    public List<Course_Category> getCourses() {
        return courses;
    }

    public void setCourses(List<Course_Category> courses) {
        this.courses = courses;
    }
}