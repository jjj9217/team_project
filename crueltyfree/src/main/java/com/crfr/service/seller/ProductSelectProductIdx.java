package com.crfr.service.seller;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductInsertDao;

import lombok.RequiredArgsConstructor;

@Service("pfindProductIdx")
@RequiredArgsConstructor
public class ProductSelectProductIdx implements ProductSellerService{
	private final ProductInsertDao dao;
	
	public int findProductIdx (String product_name, String member_nickname) {
		return dao.findProductIdx (product_name, member_nickname);
	}
}
