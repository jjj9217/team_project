package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectReviewCount")
@RequiredArgsConstructor
public class ProductSelectReviewCountService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int selectReviewCount(int product_idx) {
		return dao.selectReviewCount(product_idx);
	}
}
