package com.crfr.service.orderDelivery;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDeliveryDao;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("mSelectDlvStatus")
@RequiredArgsConstructor
public class OrderDeliverySelectDlvStatusService implements OrderDeliveryService{
	private final OrderDeliveryDao dao;
	
	public int selectDlvStatus(int order_idx, int product_idx, Timestamp timestamp_begin, Timestamp timestamp_end) {
		return dao.selectDlvStatus(order_idx, product_idx, timestamp_begin, timestamp_end);
	}
}
