package com.crfr.service.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

@Service("oneDelete")
public class OneDeleteService implements ManagerService {
	private ManagerDao dao;
	
	@Autowired
	public OneDeleteService(ManagerDao dao) {
		this.dao = dao;
	}

	public int onedelete(String one_inq_idx) {
		return dao.onedelete(one_inq_idx);
	}
}