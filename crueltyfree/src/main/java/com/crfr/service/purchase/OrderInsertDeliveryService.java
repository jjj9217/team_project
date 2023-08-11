package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;
import com.crfr.vo.BasketVo;
import com.crfr.vo.DeliveryVo;

import lombok.RequiredArgsConstructor;

@Service("oInsertDelivery")
@RequiredArgsConstructor
public class OrderInsertDeliveryService implements PurchaseService {
	private final OrderDao dao;
	
	public int insertDelivery(DeliveryVo deliveryVo){	
		return dao.insertDelivery(deliveryVo);
	}
}
