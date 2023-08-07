package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.LikeVo;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectLike")
@RequiredArgsConstructor
public class ProductSelectLikeService implements ProductViewService{
	private final ProductViewDao dao;
	
	public LikeVo selectLike(int product_idx, int member_idx) {
		return dao.selectLike(product_idx, member_idx);
	}
}
