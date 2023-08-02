package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.BasketDao;

import lombok.RequiredArgsConstructor;

@Service("bPlusBasketMultipleCount")
@RequiredArgsConstructor
public class BasketMultipleCountPlusService implements PurchaseService {
	private final BasketDao dao;
	
	public void plusBasketMultipleCount(int product_idx, int prd_cart_cnt, String client_num) {		
		dao.plusBasketMultipleCount(product_idx, prd_cart_cnt, client_num);
	}
}
