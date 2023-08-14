package com.crfr.service.manager;

import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

import lombok.RequiredArgsConstructor;

@Service("memcheckDelete")
@RequiredArgsConstructor
public class MemberCheckDeleteService implements ManagerService {
	private final ManagerDao dao;
	
	public int memberDeleteOne(String member_idx) {		
		return dao.memberDeleteOne(member_idx);
	}
}