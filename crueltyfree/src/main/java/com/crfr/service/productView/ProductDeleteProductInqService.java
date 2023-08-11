package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pDeleteProductInq")
@RequiredArgsConstructor
public class ProductDeleteProductInqService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int deleteProductInq(String product_inq_idx) {
		return dao.deleteProductInq(product_inq_idx);
	}
}
