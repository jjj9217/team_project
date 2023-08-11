package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;

import lombok.RequiredArgsConstructor;

@Service("oUpdateOrder")
@RequiredArgsConstructor
public class OrderUpdateOrderService implements PurchaseService {
	private final OrderDao dao;
	
	public void updateOrder(String order_idx) {		
		dao.updateOrder(order_idx);
	}
}
