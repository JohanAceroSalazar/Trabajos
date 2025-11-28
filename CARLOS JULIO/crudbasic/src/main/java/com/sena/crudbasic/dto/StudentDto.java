package com.sena.crudbasic.dto;

public class StudentDto {

    private int id;
    private String full_name;

    public StudentDto(int id, String full_name) {
        this.id = id;
        this.full_name = full_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }
}