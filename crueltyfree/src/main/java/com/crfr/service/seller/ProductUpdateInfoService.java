package com.crfr.service.seller;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pUpdateProductInfo")
@RequiredArgsConstructor
public class ProductUpdateInfoService implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public int updateProductInfo(String product_info_amount,
			String product_info_useMethod, String product_info_maker,
			String product_info_handphone, String product_idx) {
		
		//다른 폼의 전달값을 ProductInfoVo에 저장하기
		ProductInfoVo vo = new ProductInfoVo();
		vo.setProduct_info_amount(product_info_amount);
		vo.setProduct_info_useMethod(product_info_useMethod);
		vo.setProduct_info_maker(product_info_maker);
		vo.setProduct_info_handphone(product_info_handphone);
		vo.setProduct_idx(Integer.parseInt(product_idx));
		
		return dao.updateProductInfo(vo);
	}
}
