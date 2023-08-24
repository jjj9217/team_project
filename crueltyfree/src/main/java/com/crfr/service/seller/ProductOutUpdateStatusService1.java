package com.crfr.service.seller;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("pUpdateProductOutStatus1")
@RequiredArgsConstructor
public class ProductOutUpdateStatusService1 implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public int updateProductOutStatus1(int order_idx, int product_idx) {
		return dao.updateProductOutStatus1(order_idx, product_idx);
	}
}