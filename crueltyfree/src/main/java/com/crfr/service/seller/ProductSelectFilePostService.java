package com.crfr.service.seller;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.FileVo;

import lombok.RequiredArgsConstructor;

@Service("pfineProductFilePost")
@RequiredArgsConstructor
public class ProductSelectFilePostService implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public List<FileVo> findProductFilePost(String product_idx) {
		return dao.findProductFilePost(product_idx);
	}
}