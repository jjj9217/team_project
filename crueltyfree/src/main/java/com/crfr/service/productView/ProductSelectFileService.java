package com.crfr.service.productView;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.FileVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectFile")
@RequiredArgsConstructor
public class ProductSelectFileService implements ProductViewService{
	private final ProductViewDao dao;
	
	public List<FileVo> selectFile(int product_idx) {
		return dao.selectFile(product_idx);
	}
}
