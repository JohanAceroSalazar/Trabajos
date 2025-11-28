package com.sena.crudbasic.dto;

public class EnrollmentDto {
    private int id;
    private String enrollment_date;

    public EnrollmentDto(int id, String enrollment_date) {
        super();
        this.id = id;
        this.enrollment_date = enrollment_date;
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
}