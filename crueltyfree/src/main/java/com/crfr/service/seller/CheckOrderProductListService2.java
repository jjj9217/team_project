package com.crfr.service.seller;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.OrderProductVo;

import lombok.RequiredArgsConstructor;

@Service("cOrderProductList2")
@RequiredArgsConstructor
public class CheckOrderProductListService2 implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public List<OrderProductVo> checkOrderProductList2(int order_idx){
		return dao.checkOrderProductList2(order_idx);
	}
}