package com.crfr.service.product;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectProductInfo")
@RequiredArgsConstructor
public class ProductSelectProductInfoService implements ProductService{
	private final ProductDao dao;
	
	public ProductInfoVo selectInfo(int product_idx) {
		return dao.selectInfo(product_idx);
	}
}
