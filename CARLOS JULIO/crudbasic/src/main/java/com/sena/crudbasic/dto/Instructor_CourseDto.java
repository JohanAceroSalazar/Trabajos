package com.sena.crudbasic.dto;

import com.sena.crudbasic.Model.Course;
import com.sena.crudbasic.Model.Instructor;

public class Instructor_CourseDto {

    private int id;
    private Instructor instructor;
    private Course course;

    public Instructor_CourseDto(int id, Instructor instructor, Course course) {
        this.id = id;
        this.instructor = instructor;
        this.course = course;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}