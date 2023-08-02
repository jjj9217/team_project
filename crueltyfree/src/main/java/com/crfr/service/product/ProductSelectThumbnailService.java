package com.crfr.service.product;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.FileVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectThumbnail")
@RequiredArgsConstructor
public class ProductSelectThumbnailService implements ProductService{
	private final ProductDao dao;
	
	public FileVo selectThumbnail(int product_idx) {
		return dao.selectThumbnail(product_idx);
	}
}
