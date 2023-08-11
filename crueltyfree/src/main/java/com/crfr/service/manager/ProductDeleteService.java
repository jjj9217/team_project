package com.crfr.service.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

@Service("proDelete")
public class ProductDeleteService implements ManagerService {
	private ManagerDao dao;
	
	@Autowired
	public ProductDeleteService(ManagerDao dao) {
		this.dao = dao;
	}

	public int delete(String product_idx) {
		return dao.delete(product_idx);
	}
}