package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pInsertProductInq")
@RequiredArgsConstructor
public class ProductInsertProductInqService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int insertProductInq(String member_idx, String product_idx, String product_inq_content, String member_nickname) {
		return dao.insertProductInq(member_idx, product_idx, product_inq_content, member_nickname);
	}
}
