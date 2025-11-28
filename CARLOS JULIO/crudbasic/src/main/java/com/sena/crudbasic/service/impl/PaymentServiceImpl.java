package com.sena.crudbasic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sena.crudbasic.Model.Payment;
import com.sena.crudbasic.dto.PaymentDto;
import com.sena.crudbasic.repository.PaymentRepository;
import com.sena.crudbasic.service.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentRepository repo;

    @Override
    public List<Payment> findAll(){
        return this.repo.findAll();
    }

    @Override
    public Payment findById(int id){
        return repo.findById(id).orElse(null);
    }

    @Override
    public List<Payment> filterByAmount(double amount){
        return repo.filterByAmount(amount);
    }

    public Payment dtoToModel(PaymentDto paymentDto){
        return new Payment(
            paymentDto.getId(),
            paymentDto.getAmount()
        );
    }

    public Payment modelToDto(Payment payment){
        return new Payment(
            payment.getId(),
            payment.getAmount()
        );
    }

    @Override
    public String save(PaymentDto paymentDto){
        Payment payment = dtoToModel(paymentDto);
        repo.save(payment);
        return "Pago guardado exitosamente";
    }

    @Override
    public String delete(int id){
        repo.deleteById(id);
        return null;
    }
}