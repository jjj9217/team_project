package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;

import lombok.RequiredArgsConstructor;

@Service("oUpdateProductOutStatus")
@RequiredArgsConstructor
public class ProductUpdateStateService implements PurchaseService {
	private final OrderDao dao;
	
	public int updateProductOutStatus(int order_idx, int product_idx) {
		return dao.updateProductOutStatus(order_idx, product_idx);
	}
}