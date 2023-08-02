package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.BasketDao;

import lombok.RequiredArgsConstructor;

@Service("bUpdateBasketCount")
@RequiredArgsConstructor
public class BasketCountUpdateService implements PurchaseService {
	private final BasketDao dao;
	
	public void updateBasketCount(int product_idx, int basket_count, String client_num) {		
		dao.updateBasketCount(product_idx, basket_count, client_num);
	}
}
