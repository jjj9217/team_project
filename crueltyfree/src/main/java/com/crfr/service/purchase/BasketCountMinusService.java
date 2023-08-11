package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.BasketDao;

import lombok.RequiredArgsConstructor;

@Service("bMinusBasketCount")
@RequiredArgsConstructor
public class BasketCountMinusService implements PurchaseService {
	private final BasketDao dao;
	
	public void minusBasketCount(int product_idx, String client_num) {		
		dao.minusBasketCount(product_idx, client_num);
	}
}
