package com.crfr.service.orderDelivery;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDeliveryDao;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("mSelectOrderVo")
@RequiredArgsConstructor
public class OrderDeliverySelectOrderVoService implements OrderDeliveryService{
	private final OrderDeliveryDao dao;
	
	public List<OrderVo> selectOrderVo(int member_idx){
		return dao.selectOrderVo(member_idx);
	}
}
