package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectProductInqCount")
@RequiredArgsConstructor
public class ProductSelectProductInqCountService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int selectProductInqCount(int product_idx) {
		return dao.selectProductInqCount(product_idx);
	}
}
