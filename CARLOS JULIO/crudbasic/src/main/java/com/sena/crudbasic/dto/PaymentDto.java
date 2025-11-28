package com.sena.crudbasic.dto;

public class PaymentDto {

    private int id;
    private double amount;
    
    public PaymentDto(int id, double amount) {
        super();
        this.id = id;
        this.amount = amount;
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
}