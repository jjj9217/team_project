package com.crfr.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MemberDao;
import com.crfr.vo.MemberVo;

@Service("mJoin")
public class MemberJoinService implements MemberService{
	private MemberDao dao;
	
	@Autowired
	public MemberJoinService(MemberDao dao) {
		this.dao = dao;
	}
	
	public int join(MemberVo memberVo) {
		
		return dao.join(memberVo);
	}
	
}