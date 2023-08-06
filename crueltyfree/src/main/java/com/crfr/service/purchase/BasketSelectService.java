package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;
import com.crfr.vo.BasketVo;

import lombok.RequiredArgsConstructor;

@Service("oSelectBasket")
@RequiredArgsConstructor
public class BasketSelectService implements PurchaseService {
	private final OrderDao dao;
	
	public BasketVo selectBasket(String basket_idx) {	
		return dao.selectBasket(basket_idx);
	}
}
