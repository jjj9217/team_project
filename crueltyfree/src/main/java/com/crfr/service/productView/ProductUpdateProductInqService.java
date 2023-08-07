package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pUpdateProductInq")
@RequiredArgsConstructor
public class ProductUpdateProductInqService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int updateProductInq(String product_inq_idx, String product_inq_content) {
		return dao.updateProductInq(product_inq_idx, product_inq_content);
	}
}
