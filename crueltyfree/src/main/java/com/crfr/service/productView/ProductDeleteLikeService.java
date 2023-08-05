package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pDeleteLike")
@RequiredArgsConstructor
public class ProductDeleteLikeService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int deletelike(String product_idx, String member_idx) {
		return dao.deletelike(product_idx, member_idx);
	}
}
