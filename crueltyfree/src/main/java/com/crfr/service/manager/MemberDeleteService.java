package com.crfr.service.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

@Service("memDelete")
public class MemberDeleteService implements ManagerService {
	private ManagerDao dao;
	
	@Autowired
	public MemberDeleteService(ManagerDao dao) {
		this.dao = dao;
	}

	public int memdelete(String member_idx) {
		return dao.memdelete(member_idx);
	}
}