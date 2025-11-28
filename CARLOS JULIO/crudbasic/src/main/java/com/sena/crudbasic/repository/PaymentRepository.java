package com.sena.crudbasic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.sena.crudbasic.Model.Payment;

@Repository
public interface PaymentRepository
extends JpaRepository<Payment, Integer> {

    @Query(""
			+ "SELECT "
			+ "p "
			+ "FROM "
			+ "payment p "
			+ "WHERE "
			+ "p.amount = :amount"
			)
	public List<Payment>filterByAmount(@Param("amount") double amount);
}