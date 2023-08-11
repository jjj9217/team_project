package com.crfr.service.seller;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pfineProductInfoPost")
@RequiredArgsConstructor
public class ProductSelectInfoPostService implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public ProductInfoVo findProductInfoPost(String product_idx) {
		return dao.findProductInfoPost(product_idx);
	}
}