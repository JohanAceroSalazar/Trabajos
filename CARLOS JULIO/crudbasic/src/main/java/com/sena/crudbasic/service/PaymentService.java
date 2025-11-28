package com.sena.crudbasic.service;

import java.util.List;
import com.sena.crudbasic.Model.Payment;
import com.sena.crudbasic.dto.PaymentDto;

public interface PaymentService {

    public List<Payment> findAll();
	public Payment findById(int id);
	public List<Payment> filterByAmount(double amount);
	public String save(PaymentDto p);
	public String delete(int id);
}