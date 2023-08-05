package com.crfr.service.product;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectReviewCount")
@RequiredArgsConstructor
public class ProductSelectReviewCountService implements ProductService{
	private final ProductDao dao;
	
	public int selectReviewCount(int product_idx) {
		return dao.selectReviewCount(product_idx);
	}
}
