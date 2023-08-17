package com.crfr.service.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

@Service("selDeleteFile")
public class SellerDeleteFileService implements ManagerService {
	private ManagerDao dao;
	
	@Autowired
	public SellerDeleteFileService(ManagerDao dao) {
		this.dao = dao;
	}

	public int selDeleteFile(String one_inq_idx) {
		return dao.selDeleteFile(one_inq_idx);
	}
}