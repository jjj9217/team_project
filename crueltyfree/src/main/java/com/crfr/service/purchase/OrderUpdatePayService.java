package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;

import lombok.RequiredArgsConstructor;

@Service("oUpdatePay")
@RequiredArgsConstructor
public class OrderUpdatePayService implements PurchaseService {
	private final OrderDao dao;
	
	public void updatePay(String order_idx) {		
		dao.updatePay(order_idx);
	}
}
