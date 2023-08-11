package com.crfr.service.productView;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.FileVo;
import com.crfr.vo.ProductInqVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectProductInq")
@RequiredArgsConstructor
public class ProductSelectProductInqService implements ProductViewService{
	private final ProductViewDao dao;
	
	public List<ProductInqVo> selectProductInq(int product_idx) {
		return dao.selectProductInq(product_idx);
	}
}
