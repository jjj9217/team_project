package com.crfr.service.seller;

import org.springframework.stereotype.Service;
import com.crfr.dao.ProductInsertDao;
import com.crfr.vo.ProductInfoVo;
import lombok.RequiredArgsConstructor;

@Service("pInsertProductInfo")
@RequiredArgsConstructor
public class ProductInsertInfoService implements ProductSellerService {
	private final ProductInsertDao dao;
	
	public int insertProductInfo(String product_idx, String product_info_amount,
			String product_info_useMethod, String product_info_maker,
			String product_info_handphone) {
		
		//다른 폼의 전달값을 FileVo에 저장하기
		ProductInfoVo vo = new ProductInfoVo();
		vo.setProduct_idx(Integer.parseInt(product_idx));
		vo.setProduct_info_amount(product_info_amount);
		vo.setProduct_info_useMethod(product_info_useMethod);
		vo.setProduct_info_maker(product_info_maker);
		vo.setProduct_info_handphone(product_info_handphone);
		
		return dao.insertProductInfo(vo);
	}
}
