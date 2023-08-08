package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;
import com.crfr.vo.BasketVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("oInsertOrder")
@RequiredArgsConstructor
public class OrderInsertOrderService implements PurchaseService {
	private final OrderDao dao;
	
	public int insertOrder(OrderVo orderVo){	
		return dao.insertOrder(orderVo);
	}
}
