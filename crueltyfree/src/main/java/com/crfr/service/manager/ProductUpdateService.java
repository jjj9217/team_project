package com.crfr.service.manager;

import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pUpdateProduct")
@RequiredArgsConstructor
public class ProductUpdateService implements ManagerService {
	private final ManagerDao dao;
	
	public int productUpdate(String product_name, String product_price, String product_capa,
			String delivery_company, String product_idx) {
		
		ProductVo vo = new ProductVo();
		vo.setProduct_name(product_name);
		vo.setProduct_price(Integer.parseInt(product_price));
		vo.setProduct_capa(Integer.parseInt(product_capa));
		vo.setDelivery_company(Integer.parseInt(delivery_company));
		vo.setProduct_idx(Integer.parseInt(product_idx));

		
		return dao.productUpdate(vo);
	}
	

}
