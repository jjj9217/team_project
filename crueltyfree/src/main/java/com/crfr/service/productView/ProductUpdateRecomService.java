package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pUpdateRecom")
@RequiredArgsConstructor
public class ProductUpdateRecomService implements ProductViewService{
	private final ProductViewDao dao;
	
	public void updateRecom(String review_idx, int recomCount) {
		dao.updateRecom(review_idx, recomCount);
	}
}
