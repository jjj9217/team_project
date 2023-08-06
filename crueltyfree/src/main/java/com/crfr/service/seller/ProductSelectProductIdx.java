package com.crfr.service.seller;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pfindProductIdx")
@RequiredArgsConstructor
public class ProductSelectProductIdx implements ProductSellerService{
	private final ProductDao dao;
	
	public ProductVo findProductIdx (String product_name, String member_nickname) {
		return dao.findProductIdx (product_name, member_nickname);
	}
}
