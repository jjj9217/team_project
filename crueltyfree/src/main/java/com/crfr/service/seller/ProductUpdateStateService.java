package com.crfr.service.seller;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("pUpdateDeliveryState")
@RequiredArgsConstructor
public class ProductUpdateStateService implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public int updateDeliveryState(String order_num){
		return dao.updateDeliveryState(order_num);
	}
}