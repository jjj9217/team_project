package com.crfr.service.orderDelivery;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDeliveryDao;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("mSelectRefundCount")
@RequiredArgsConstructor
public class OrderDeliverySelectRefundCountService implements OrderDeliveryService{
	private final OrderDeliveryDao dao;
	
	public int selectRefundCount(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end){
		return dao.selectRefundCount(member_idx, timestamp_begin, timestamp_end);
	}
}
