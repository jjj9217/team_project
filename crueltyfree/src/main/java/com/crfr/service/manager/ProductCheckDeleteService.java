package com.crfr.service.manager;

import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

import lombok.RequiredArgsConstructor;

@Service("procheckDelete")
@RequiredArgsConstructor
public class ProductCheckDeleteService implements ManagerService {
	private final ManagerDao dao;
	
	public int productDeleteOne(String product_idx) {		
		return dao.productDeleteOne(product_idx);
	}
}
