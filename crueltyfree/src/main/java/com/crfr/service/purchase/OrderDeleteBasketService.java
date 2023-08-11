package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;
import com.crfr.vo.BasketVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.OrderVo;
import com.crfr.vo.PayVo;

import lombok.RequiredArgsConstructor;

@Service("oDeleteBasket")
@RequiredArgsConstructor
public class OrderDeleteBasketService implements PurchaseService {
	private final OrderDao dao;
	
	public int deleteBasket(String basket_idx){	
		return dao.deleteBasket(basket_idx);
	}
}
