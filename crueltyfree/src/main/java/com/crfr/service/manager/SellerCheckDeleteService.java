package com.crfr.service.manager;

import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

import lombok.RequiredArgsConstructor;

@Service("selcheckDelete")
@RequiredArgsConstructor
public class SellerCheckDeleteService implements ManagerService {
	private final ManagerDao dao;
	
	public int seloneinqDeleteOne(String one_inq_idx) {		
		return dao.seloneinqDeleteOne(one_inq_idx);
	}
}