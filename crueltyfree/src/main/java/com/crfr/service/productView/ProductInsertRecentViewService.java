package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pInsertRecentView")
@RequiredArgsConstructor
public class ProductInsertRecentViewService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int insertRecentView(String client_num, int product_idx) {
		return dao.insertRecentView(client_num, product_idx);
	}
}
