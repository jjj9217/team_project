package com.crfr.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MemberDao;
import com.crfr.vo.MemberVo;

@Service("mFindId")
public class MemberFindIdService implements MemberService{
	private MemberDao dao;
	
	@Autowired
	public MemberFindIdService(MemberDao dao) {
		this.dao = dao;
	}
	
	public MemberVo findId(String member_name, String member_handphone) {
		
		return dao.findId(member_name, member_handphone);
	}
	
}
