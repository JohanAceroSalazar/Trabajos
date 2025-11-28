package com.sena.crudbasic.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity(name = "payment")
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_payment")
    private int id;

    @Column(name = "amount")
    private double amount;

    public Payment() {
    }

    public Payment(int id, double amount, Enrollment enrollment) {
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

    @ManyToOne
    @JoinColumn(name = "id_enrollment")
    private Enrollment enrollment;
}