package com.crfr.service.seller;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("pUpdateDeliveryState2")
@RequiredArgsConstructor
public class ProductUpdateStateService2 implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public int updateDeliveryState2(String order_num){
		return dao.updateDeliveryState2(order_num);
	}
}