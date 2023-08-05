package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectProductInfo")
@RequiredArgsConstructor
public class ProductSelectProductInfoService implements ProductViewService{
	private final ProductViewDao dao;
	
	public ProductInfoVo selectInfo(int product_idx) {
		return dao.selectInfo(product_idx);
	}
}
