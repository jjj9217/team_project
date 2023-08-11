package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;

import lombok.RequiredArgsConstructor;

@Service("oSelectDeliveryCount")
@RequiredArgsConstructor
public class OrderSelectDeliveryCountService implements PurchaseService {
	private final OrderDao dao;
	
	public int selectDeliveryCount(String client_num) {		
		return dao.selectDeliveryCount(client_num);
	}
}
