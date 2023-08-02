package com.crfr.service.product;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectView")
@RequiredArgsConstructor
public class ProductSelectViewService implements ProductService{
	private final ProductDao dao;
	
	public ProductVo selectView(int product_idx) {
		return dao.selectView(product_idx);
	}
}
