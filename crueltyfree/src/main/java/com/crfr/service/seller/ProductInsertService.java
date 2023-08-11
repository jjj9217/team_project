package com.crfr.service.seller;

import org.springframework.stereotype.Service;
import com.crfr.dao.ProductInsertDao;
import com.crfr.vo.ProductVo;
import lombok.RequiredArgsConstructor;

@Service("pInsertProduct")
@RequiredArgsConstructor
public class ProductInsertService implements ProductSellerService {
	private final ProductInsertDao dao;
	
	public int insertProduct(String category_code,
			String product_name, String product_price, String product_capa,
			String delivery_company, String member_nickname, String member_idx) {
		
		//다른 폼의 전달값을 FileVo에 저장하기
		ProductVo vo = new ProductVo();
		vo.setCategory_code(category_code);
		vo.setProduct_name(product_name);
		vo.setProduct_price(Integer.parseInt(product_price));
		vo.setProduct_capa(Integer.parseInt(product_capa));
		vo.setDelivery_company(Integer.parseInt(delivery_company));
		vo.setMember_nickname(member_nickname);
		vo.setMember_idx(Integer.parseInt(member_idx));
		
		return dao.insertProduct(vo);
	}
}