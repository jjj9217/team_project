package com.crfr.service.seller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;

import lombok.RequiredArgsConstructor;

@Service("cProductCount")
@RequiredArgsConstructor
public class CheckProductCountService implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public int checkProductCount(String searchField, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}	
		return dao.checkProductCount(map);
	}
}
