package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.BasketDao;

import lombok.RequiredArgsConstructor;

@Service("bPlusBasketCount")
@RequiredArgsConstructor
public class BasketCountPlusService implements PurchaseService {
	private final BasketDao dao;
	
	public void plusBasketCount(int product_idx, String client_num) {		
		dao.plusBasketCount(product_idx, client_num);
	}
}
