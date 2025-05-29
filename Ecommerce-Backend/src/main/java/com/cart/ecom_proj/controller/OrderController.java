package com.cart.ecom_proj.controller;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cart.ecom_proj.bean.APIResponse;
import com.cart.ecom_proj.model.Order;
import com.cart.ecom_proj.service.OrderService;

@RestController
@CrossOrigin
@RequestMapping("/api/orders")
public class OrderController {
	@Autowired
	private OrderService orderService;

	@PostMapping
	public ResponseEntity<APIResponse<Order>> placeOrder(@RequestBody Order orderRequest) {
		String orderId = UUID.randomUUID().toString();orderRequest.setOrderTrackId(orderId);
		orderRequest = orderService.saveOrder(orderRequest);
		return ResponseEntity.ok(new APIResponse<>(true, "Order Placed Successfully", orderRequest));
	}

}
