package com.crfr.service.seller;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.FileVo;

import lombok.RequiredArgsConstructor;

@Service("pfindProductFileIdx")
@RequiredArgsConstructor
public class ProductSelectFileIdx implements ProductSellerService{
	private final ProductSellerDao dao;
	
	public List<FileVo> findProductFileIdx (String product_idx) {
		return dao.findProductFileIdx (product_idx);
	}
}