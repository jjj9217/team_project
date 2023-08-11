package com.crfr.service.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

@Service("rvDelete")
public class ReviewDeleteService implements ManagerService {
	private ManagerDao dao;
	
	@Autowired
	public ReviewDeleteService(ManagerDao dao) {
		this.dao = dao;
	}

	public int reviewdelete(String review_idx) {
		return dao.reviewdelete(review_idx);
	}
}