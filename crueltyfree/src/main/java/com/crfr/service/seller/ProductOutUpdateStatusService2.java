package com.crfr.service.seller;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("pUpdateProductOutStatus2")
@RequiredArgsConstructor
public class ProductOutUpdateStatusService2 implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public int updateProductOutStatus2(int order_idx, int product_idx) {
		return dao.updateProductOutStatus2(order_idx, product_idx);
	}
}