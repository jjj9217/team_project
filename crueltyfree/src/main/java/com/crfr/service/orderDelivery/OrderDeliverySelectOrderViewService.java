package com.crfr.service.orderDelivery;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDeliveryDao;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("mSelectOrderView")
@RequiredArgsConstructor
public class OrderDeliverySelectOrderViewService implements OrderDeliveryService{
	private final OrderDeliveryDao dao;
	
	public OrderVo selectOrderView(String order_num){
		return dao.selectOrderView(order_num);
	}
}
