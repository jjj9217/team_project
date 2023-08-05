package com.crfr.service.product;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pInsertLike")
@RequiredArgsConstructor
public class ProductInsertLikeService implements ProductService{
	private final ProductDao dao;
	
	public int insertlike(String product_idx, String member_idx) {
		return dao.insertlike(product_idx, member_idx);
	}
}
