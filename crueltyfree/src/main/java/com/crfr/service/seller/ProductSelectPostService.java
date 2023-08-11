package com.crfr.service.seller;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pfineProductPost")
@RequiredArgsConstructor
public class ProductSelectPostService implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public ProductVo findProductPost(String product_idx) {
		return dao.findProductPost(product_idx);
	}
}