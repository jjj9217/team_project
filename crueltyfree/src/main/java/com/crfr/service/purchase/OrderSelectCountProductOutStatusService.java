package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;

import lombok.RequiredArgsConstructor;

@Service("oSelectCountProductOutStatus")
@RequiredArgsConstructor
public class OrderSelectCountProductOutStatusService implements PurchaseService {
	private final OrderDao dao;
	
	public int selectCountProductOutStatus(String order_idx) {		
		return dao.selectCountProductOutStatus(order_idx);
	}
}
