package com.sena.crudbasic.dto;

import com.sena.crudbasic.Model.Course;
import com.sena.crudbasic.Model.Student;

public class EnrollmentDto {
    private int id;
    private String enrollment_date;
    private Course course;
    private Student student;


    public EnrollmentDto(int id, String enrollment_date, Course course, Student student) {
        this.id = id;
        this.enrollment_date = enrollment_date;
        this.course = course;
        this.student = student;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEnrollment_date() {
        return enrollment_date;
    }

    public void setEnrollment_date(String enrollment_date) {
        this.enrollment_date = enrollment_date;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}