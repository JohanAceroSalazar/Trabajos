package com.sena.crudbasic.dto;

import com.sena.crudbasic.Model.Enrollment;

public class PaymentDto {

    private int id;
    private double amount;
    private Enrollment enrollment;
    
    public PaymentDto(int id, double amount, Enrollment enrollment) {
        super();
        this.id = id;
        this.amount = amount;
        this.enrollment = enrollment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Enrollment getEnrollment() {
        return enrollment;
    }

    public void setEnrollment(Enrollment enrollment) {
        this.enrollment = enrollment;
    }
}