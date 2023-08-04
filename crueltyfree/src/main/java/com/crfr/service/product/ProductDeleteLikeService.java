package com.crfr.service.product;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pDeleteLike")
@RequiredArgsConstructor
public class ProductDeleteLikeService implements ProductService{
	private final ProductDao dao;
	
	public int deletelike(String product_idx, String member_idx) {
		return dao.deletelike(product_idx, member_idx);
	}
}
