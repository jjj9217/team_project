package com.crfr.service.seller;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.OrderProductVo;

import lombok.RequiredArgsConstructor;

@Service("cOrderProductList")
@RequiredArgsConstructor
public class CheckOrderProductListService implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public List<OrderProductVo> checkOrderProductList(int product_idx){
		return dao.checkOrderProductList(product_idx);
	}
}