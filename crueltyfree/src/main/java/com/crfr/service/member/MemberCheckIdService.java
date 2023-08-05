package com.crfr.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MemberDao;

@Service("mCheckId")
public class MemberCheckIdService implements MemberService{
	private MemberDao dao;
	
	@Autowired
	public MemberCheckIdService(MemberDao dao) {
		this.dao = dao;
	}
	
	public int checkId(String member_id) {
		
		return dao.checkId(member_id);
	}
	
}