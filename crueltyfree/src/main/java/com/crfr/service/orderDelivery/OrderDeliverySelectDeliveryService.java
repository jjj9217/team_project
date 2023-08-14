package com.crfr.service.orderDelivery;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDeliveryDao;
import com.crfr.vo.DeliveryVo;

import lombok.RequiredArgsConstructor;

@Service("mSelectDelivery")
@RequiredArgsConstructor
public class OrderDeliverySelectDeliveryService implements OrderDeliveryService{
	private final OrderDeliveryDao dao;
	
	public DeliveryVo selectDelivery(int delivery_idx){
		return dao.selectDelivery(delivery_idx);
	}
}
