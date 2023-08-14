package com.crfr.service.manager;

import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

import lombok.RequiredArgsConstructor;

@Service("rvcheckDelete")
@RequiredArgsConstructor
public class ReviewCheckDeleteService implements ManagerService {
	private final ManagerDao dao;
	
	public int reviewDeleteOne(String review_idx) {		
		return dao.reviewDeleteOne(review_idx);
	}
}
