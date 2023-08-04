package com.crfr.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.FileVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectFile")
@RequiredArgsConstructor
public class ProductSelectFileService implements ProductService{
	private final ProductDao dao;
	
	public List<FileVo> selectFile(int product_idx) {
		return dao.selectFile(product_idx);
	}
}
