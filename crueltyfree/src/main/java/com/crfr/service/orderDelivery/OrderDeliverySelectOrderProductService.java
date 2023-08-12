package com.crfr.service.orderDelivery;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDeliveryDao;
import com.crfr.vo.OrderProductVo;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("mSelectOrderProduct")
@RequiredArgsConstructor
public class OrderDeliverySelectOrderProductService implements OrderDeliveryService{
	private final OrderDeliveryDao dao;
	
	public List<OrderProductVo> selectOrderProduct (int order_idx){
		return dao.selectOrderProduct(order_idx);
	}
}
