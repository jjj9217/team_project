package com.crfr.service.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;
import com.crfr.vo.MemberVo;

@Service("memSList")
public class MemberSelectListService implements ManagerService{
	private ManagerDao dao;
	
	@Autowired
	public MemberSelectListService(ManagerDao dao) {
		this.dao = dao;
	}
	
	public List<MemberVo> memSelectList(String searchField, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(searchWord != null) {
			map.put("searchField",searchField);
			map.put("searchWord", searchWord);	
		}
		return dao.memSelectList(map);
	}
}