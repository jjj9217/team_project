package com.crfr.service.product;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pDeleteProductInq")
@RequiredArgsConstructor
public class ProductDeleteProductInqService implements ProductService{
	private final ProductDao dao;
	
	public int deleteProductInq(String product_inq_idx) {
		return dao.deleteProductInq(product_inq_idx);
	}
}
