package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectView")
@RequiredArgsConstructor
public class ProductSelectViewService implements ProductViewService{
	private final ProductViewDao dao;
	
	public ProductVo selectView(int product_idx) {
		return dao.selectView(product_idx);
	}
}
