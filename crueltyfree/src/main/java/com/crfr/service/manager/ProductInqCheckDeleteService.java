package com.crfr.service.manager;

import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

import lombok.RequiredArgsConstructor;

@Service("proinqcheckDelete")
@RequiredArgsConstructor
public class ProductInqCheckDeleteService implements ManagerService {
	private final ManagerDao dao;
	
	public int productinqDeleteOne(String product_inq_idx) {		
		return dao.productinqDeleteOne(product_inq_idx);
	}
}