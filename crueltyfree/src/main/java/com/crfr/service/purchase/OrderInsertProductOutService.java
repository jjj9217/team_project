package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;
import com.crfr.vo.BasketVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.OrderVo;
import com.crfr.vo.PayVo;

import lombok.RequiredArgsConstructor;

@Service("oInsertProductOut")
@RequiredArgsConstructor
public class OrderInsertProductOutService implements PurchaseService {
	private final OrderDao dao;
	
	public int insertProductOut(String order_idx, String product_idx, String product_out_count) {	
		return dao.insertProductOut(order_idx, product_idx, product_out_count);
	}
}
