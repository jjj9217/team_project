package com.crfr.service.manager;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

@Service("selCount")
public class SellerCountService implements ManagerService {
	private ManagerDao dao;
	
	@Autowired
	public SellerCountService(ManagerDao dao) {
		this.dao = dao;
	}
	
	public int selselectCount(String searchField, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(searchWord != null) {
			map.put("searchField",searchField);
			map.put("searchWord", searchWord);	
		}
		return dao.selselectCount(map);
	}
}