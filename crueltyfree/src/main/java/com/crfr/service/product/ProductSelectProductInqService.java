package com.crfr.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.FileVo;
import com.crfr.vo.ProductInqVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectProductInq")
@RequiredArgsConstructor
public class ProductSelectProductInqService implements ProductService{
	private final ProductDao dao;
	
	public List<ProductInqVo> selectProductInq(int product_idx) {
		return dao.selectProductInq(product_idx);
	}
}
