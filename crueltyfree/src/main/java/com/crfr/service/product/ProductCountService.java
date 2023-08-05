package com.crfr.service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.ExploreVo;

@Service("pdCount")
public class ProductCountService implements ProductService {
	private ProductDao dao;
	
	@Autowired
	public ProductCountService(ProductDao dao) {
		this.dao = dao;
	}
	
	public int selectCount(ExploreVo vo) {
		return dao.selectCount(vo);
	}
	
//	public int selectCount(String searchWord, String category_code, String category_code_small, int product_price, int product_price_max, int product_price_min) {			
//		Map<String, Object> map = new HashMap<String, Object>();
//		if(searchWord != null) {			
//			map.put("searchWord", searchWord);
//			map.put("category_code", category_code);
//			map.put("category_code_small", category_code_small);
//			map.put("product_price", product_price);
//			map.put("product_price_max", product_price_max);
//			map.put("product_price_min", product_price_min);			
//		}				
//		return dao.selectCount(map);
//	}
	
}
