package com.crfr.service.manager;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

@Service("memCount")
public class MemberCountService implements ManagerService {
	private ManagerDao dao;
	
	@Autowired
	public MemberCountService(ManagerDao dao) {
		this.dao = dao;
	}
	
	public int memselectCount(String searchField, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(searchWord != null) {
			map.put("searchField",searchField);
			map.put("searchWord", searchWord);	
		}
		return dao.memselectCount(map);
	}
}