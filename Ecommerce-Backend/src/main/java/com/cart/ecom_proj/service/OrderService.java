package com.cart.ecom_proj.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cart.ecom_proj.model.Order;
import com.cart.ecom_proj.repo.OrderRepository;

@Service

public class OrderService {

    @Autowired private OrderRepository orderRepository;

    public Order saveOrder(Order order) {
        order.setOrderStatus("PLACED");
        order.setCreatedAt(LocalDateTime.now());
        return orderRepository.save(order);
    }
}