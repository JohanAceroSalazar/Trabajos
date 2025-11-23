package com.sena.crudbasic.dto;

public class CourseDto {

	private int id;
	private String title;
	//private List<Student> students;

	public CourseDto(int id, String title) {
		super();
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