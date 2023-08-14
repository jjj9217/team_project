package com.crfr.service.seller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("cProductList")
@RequiredArgsConstructor
public class CheckProductListService implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public List<ProductVo> checkProductList(String searchField, String searchWord, String member_idx){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_idx", member_idx);
		if(searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		return dao.checkProductList(map);
	}
}