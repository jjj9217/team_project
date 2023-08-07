package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.FileVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectThumbnail")
@RequiredArgsConstructor
public class ProductSelectThumbnailService implements ProductViewService{
	private final ProductViewDao dao;
	
	public FileVo selectThumbnail(int product_idx) {
		return dao.selectThumbnail(product_idx);
	}
}
