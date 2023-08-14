package com.crfr.service.seller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.PurchaseListVo;

import lombok.RequiredArgsConstructor;

@Service("cProHistoryList")
@RequiredArgsConstructor
public class CheckProHistoryListService implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public List<PurchaseListVo> checkProductHistoryList(String searchField, String searchWord){
		Map<String, Object> map = new HashMap<String, Object>();
		if(searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		return dao.checkProductHistoryList(map);
	}
}