package com.crfr.service.product;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pUpdateProductInq")
@RequiredArgsConstructor
public class ProductUpdateProductInqService implements ProductService{
	private final ProductDao dao;
	
	public int updateProductInq(String product_inq_idx, String product_inq_content) {
		return dao.updateProductInq(product_inq_idx, product_inq_content);
	}
}
