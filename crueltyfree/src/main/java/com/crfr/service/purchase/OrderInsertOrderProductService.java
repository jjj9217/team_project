package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;
import com.crfr.vo.BasketVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.OrderVo;
import com.crfr.vo.PayVo;

import lombok.RequiredArgsConstructor;

@Service("oInsertOrderProduct")
@RequiredArgsConstructor
public class OrderInsertOrderProductService implements PurchaseService {
	private final OrderDao dao;
	
	public int insertOrderProduct(String order_idx, String product_idx, 
			String client_num, String order_product_count) {	
		return dao.insertOrderProduct(order_idx, product_idx, client_num, order_product_count);
	}
}
