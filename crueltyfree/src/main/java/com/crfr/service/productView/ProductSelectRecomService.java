package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectRecom")
@RequiredArgsConstructor
public class ProductSelectRecomService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int selectRecom(String review_idx) {
		return dao.selectRecom(review_idx);
	}
}
