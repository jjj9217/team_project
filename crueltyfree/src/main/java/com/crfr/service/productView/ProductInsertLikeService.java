package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pInsertLike")
@RequiredArgsConstructor
public class ProductInsertLikeService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int insertlike(String product_idx, String member_idx) {
		return dao.insertlike(product_idx, member_idx);
	}
}
