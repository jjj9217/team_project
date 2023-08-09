package com.crfr.service.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;
import com.crfr.vo.ProductVo;
@Service("proSList")
public class ProductSelectListService implements ManagerService{
	private ManagerDao dao;
	
	@Autowired
	public ProductSelectListService(ManagerDao dao) {
		this.dao = dao;
	}
	
	public List<ProductVo> proSelectList(String searchField, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(searchWord != null) {
			map.put("searchField",searchField);
			map.put("searchWord", searchWord);	
		}
		return dao.proSelectList(map);
	}
}