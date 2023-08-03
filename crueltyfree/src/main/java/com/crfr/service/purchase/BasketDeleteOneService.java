package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.BasketDao;

import lombok.RequiredArgsConstructor;

@Service("bBasketDeleteOne")
@RequiredArgsConstructor
public class BasketDeleteOneService implements PurchaseService {
	private final BasketDao dao;
	
	public int basketDeleteOne(String basket_idx) {		
		return dao.basketDeleteOne(basket_idx);
	}
}
