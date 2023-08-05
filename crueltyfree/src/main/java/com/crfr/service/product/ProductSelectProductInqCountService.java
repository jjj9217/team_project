package com.crfr.service.product;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectProductInqCount")
@RequiredArgsConstructor
public class ProductSelectProductInqCountService implements ProductService{
	private final ProductDao dao;
	
	public int selectProductInqCount(int product_idx) {
		return dao.selectProductInqCount(product_idx);
	}
}
