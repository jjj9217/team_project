package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pDeleteOneRecentView")
@RequiredArgsConstructor
public class ProductDeleteOneRecentViewService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int deleteOneRecentView(String client_num, int product_idx) {
		return dao.deleteOneRecentView(client_num, product_idx);
	}
}
