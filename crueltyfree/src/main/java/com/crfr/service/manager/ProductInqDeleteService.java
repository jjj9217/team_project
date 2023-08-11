package com.crfr.service.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

@Service("proinqDelete")
public class ProductInqDeleteService implements ManagerService {
	private ManagerDao dao;
	
	@Autowired
	public ProductInqDeleteService(ManagerDao dao) {
		this.dao = dao;
	}

	public int proinqdelete(String product_inq_idx) {
		return dao.proinqdelete(product_inq_idx);
	}
}