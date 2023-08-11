package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pInsertRecom")
@RequiredArgsConstructor
public class ProductInsertRecomService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int insertRecom(String review_idx, String member_idx) {
		return dao.insertRecom(review_idx, member_idx);
	}
}
