package com.crfr.service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.ProductVo;

@Service("pdView")
public class ProductViewService implements ProductService {
	private ProductDao dao;
	
	@Autowired
	public ProductViewService(ProductDao dao) {
		this.dao = dao;
	}
	
	public ProductVo selectView(int board_idx) {
		return dao.selectView(board_idx);
	}
	

}