package com.crfr.service.product;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.LikeVo;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectLike")
@RequiredArgsConstructor
public class ProductSelectLikeService implements ProductService{
	private final ProductDao dao;
	
	public LikeVo selectLike(int product_idx, int member_idx) {
		return dao.selectLike(product_idx, member_idx);
	}
}
