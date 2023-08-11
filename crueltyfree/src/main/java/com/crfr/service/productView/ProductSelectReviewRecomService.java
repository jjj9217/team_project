package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.LikeVo;
import com.crfr.vo.ProductVo;
import com.crfr.vo.ReviewRecomVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectReviewRecom")
@RequiredArgsConstructor
public class ProductSelectReviewRecomService implements ProductViewService{
	private final ProductViewDao dao;
	
	public ReviewRecomVo selectReviewRecom(int review_idx, int member_idx) {
		return dao.selectReviewRecom(review_idx, member_idx);
	}
}
