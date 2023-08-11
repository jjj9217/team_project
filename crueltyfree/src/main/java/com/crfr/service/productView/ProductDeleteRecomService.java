package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pDeleteRecom")
@RequiredArgsConstructor
public class ProductDeleteRecomService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int deleteRecom(String review_idx, String member_idx) {
		return dao.deleteRecom(review_idx, member_idx);
	}
}
