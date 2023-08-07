package com.crfr.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MemberDao;

@Service("mCheckNickName")
public class MemberCheckNickNameService implements MemberService{
	private MemberDao dao;
	
	@Autowired
	public MemberCheckNickNameService(MemberDao dao) {
		this.dao = dao;
	}
	
	public int checkNickName(String member_nickname) {
		
		return dao.checkNickName(member_nickname);
	}
	
}