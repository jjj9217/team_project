package com.crfr.service.seller;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductInsertDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectProductIdx")
@RequiredArgsConstructor
public class ProductSelectProductIdx implements ProductSellerService{
	private final ProductInsertDao dao;
	
	public int selectProductIdx (String product_name, String product_price, String member_nickname) {	
		ProductVo vo = new ProductVo();
		vo.setProduct_name(product_name);
		vo.setProduct_price(Integer.parseInt(product_price));
		vo.setMember_nickname(member_nickname);
		return dao.selectProductIdx(vo);
	}
}
