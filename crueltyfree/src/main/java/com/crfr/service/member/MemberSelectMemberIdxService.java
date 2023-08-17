package com.crfr.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MemberDao;
import com.crfr.vo.MemberVo;

@Service("mSelectMemberIdx")
public class MemberSelectMemberIdxService implements MemberService{
	private MemberDao dao;
	
	@Autowired
	public MemberSelectMemberIdxService(MemberDao dao) {
		this.dao = dao;
	}
	
	public int selectMemberIdx(MemberVo memberVo) {
		
		return dao.selectMemberIdx(memberVo);
	}
	
}