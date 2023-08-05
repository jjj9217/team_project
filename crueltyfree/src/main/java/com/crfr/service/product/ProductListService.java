package com.crfr.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.ExploreVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.ProductVo;

@Service("pdList")
public class ProductListService implements ProductService {
	private ProductDao dao;
	
	@Autowired
	public ProductListService(ProductDao dao) {
		this.dao = dao;
	}
	
	
	public List<ProductVo> selectList(ExploreVo vo) {										
		return dao.selectList(vo);
	}
	
	public List<FileVo> selectListimg(ExploreVo vo) {										
		return dao.selectListimg(vo);
	}
	
	/*
	 * public List<ProductVo> selectList_saleCount(ExploreVo vo) { return
	 * dao.selectList_saleCount(vo); }
	 * 
	 * public List<FileVo> selectListimg_saleCount(ExploreVo vo) { return
	 * dao.selectListimg_saleCount(vo); }
	 */
	
//	public List<ProductVo> selectList(String searchWord, String category_code, String category_code_small, int product_price, int product_price_max, int product_price_min){
//		Map<String, Object> map = new HashMap<String, Object>();
//		if(searchWord != null) {
//			map.put("searchWord", searchWord);
//			map.put("category_code", category_code);
//			map.put("category_code_small", category_code_small);
//			map.put("product_price", product_price);
//			map.put("product_price_max", product_price_max);
//			map.put("product_price_min", product_price_min);
//		}
//		
//		return dao.selectList(map);
//	}
	

}
