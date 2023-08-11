package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectReviewScoreAvg")
@RequiredArgsConstructor
public class ProductSelectReviewRecomAvgService implements ProductViewService{
	private final ProductViewDao dao;
	
	public double selectReviewScoreAvg(int product_idx) {
		return dao.selectReviewScoreAvg(product_idx);
	}
}
