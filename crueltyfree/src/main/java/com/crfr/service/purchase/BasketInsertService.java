package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.BasketDao;

import lombok.RequiredArgsConstructor;

@Service("bBasketInsert")
@RequiredArgsConstructor
public class BasketInsertService implements PurchaseService {
	private final BasketDao dao;
	
	public int basketInsert(int product_idx, int prd_cart_cnt, String client_num) {		
		return dao.basketInsert(product_idx, prd_cart_cnt, client_num);
	}
}
