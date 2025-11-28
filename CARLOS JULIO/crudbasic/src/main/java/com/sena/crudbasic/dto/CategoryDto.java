package com.sena.crudbasic.dto;

public class CategoryDto {

    private int id;
    private String name_category;

    public CategoryDto() {
    }

    public CategoryDto(int id, String name_category) {
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
}