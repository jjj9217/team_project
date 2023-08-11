package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;
import com.crfr.vo.BasketVo;
import com.crfr.vo.DeliveryVo;

import lombok.RequiredArgsConstructor;

@Service("oSelectDeliveryVo")
@RequiredArgsConstructor
public class OrderSelectDeliveryService implements PurchaseService {
	private final OrderDao dao;
	
	public DeliveryVo selectDeliveryVo(DeliveryVo deliveryVo) {	
		return dao.selectDeliveryVo(deliveryVo);
	}
}
