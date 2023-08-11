package com.crfr.service.manager;

import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;
import com.crfr.vo.ProductInqVo;

import lombok.RequiredArgsConstructor;

@Service("proinqUpdate")
@RequiredArgsConstructor
public class ProductInqUpdateService implements ManagerService {
	private final ManagerDao dao;
	
	public int productinqUpdate(String product_inq_answer,
			String product_inq_idx) {
		
		ProductInqVo vo = new ProductInqVo();
		vo.setProduct_inq_answer(product_inq_answer);
		vo.setProduct_inq_idx(Integer.parseInt(product_inq_idx));

		
		return dao.productinqUpdate(vo);
	}
	

}