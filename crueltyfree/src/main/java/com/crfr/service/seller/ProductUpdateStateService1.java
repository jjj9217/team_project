package com.crfr.service.seller;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("pUpdateDeliveryState1")
@RequiredArgsConstructor
public class ProductUpdateStateService1 implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public int updateDeliveryState1(String order_num){
		return dao.updateDeliveryState1(order_num);
	}
}