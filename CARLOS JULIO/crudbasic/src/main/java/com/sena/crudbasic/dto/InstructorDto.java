package com.sena.crudbasic.dto;

public class InstructorDto {

    private int id;
    private String name;
    private String specialty;

    public InstructorDto(int id, String name, String specialty) {
        super();
        this.id = id;
        this.name = name;
        this.specialty = specialty;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }
}