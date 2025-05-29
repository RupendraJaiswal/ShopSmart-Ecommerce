package com.cart.ecom_proj.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cart.ecom_proj.model.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
}