package com.crfr.service.manager;

import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

import lombok.RequiredArgsConstructor;

@Service("onecheckDelete")
@RequiredArgsConstructor
public class OneCheckDeleteService implements ManagerService {
	private final ManagerDao dao;
	
	public int oneinqDeleteOne(String one_inq_idx) {		
		return dao.oneinqDeleteOne(one_inq_idx);
	}
}