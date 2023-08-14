package com.crfr.service.seller;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("pUpdateProductCount")
@RequiredArgsConstructor
public class ProductUpdateCountService implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public int updateProductCount(String product_idx, int count){
		return dao.updateProductCount(product_idx, count);
	}
}