package com.crfr.service.orderDelivery;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDeliveryDao;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("mSelectOrderCount")
@RequiredArgsConstructor
public class OrderDeliverySelectOrderCountService implements OrderDeliveryService{
	private final OrderDeliveryDao dao;
	
	public int selectOrderCount(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end){
		return dao.selectOrderCount(member_idx, timestamp_begin, timestamp_end);
	}
}
