package com.crfr.service.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

@Service("selDelete")
public class SellerDeleteService implements ManagerService {
	private ManagerDao dao;
	
	@Autowired
	public SellerDeleteService(ManagerDao dao) {
		this.dao = dao;
	}

	public int seldelete(String one_inq_idx) {
		return dao.onedelete(one_inq_idx);
	}
}