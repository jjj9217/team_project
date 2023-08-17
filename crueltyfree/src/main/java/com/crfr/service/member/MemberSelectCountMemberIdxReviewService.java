package com.crfr.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MemberDao;
import com.crfr.vo.MemberVo;

@Service("mSelectCountMemberIdxReview")
public class MemberSelectCountMemberIdxReviewService implements MemberService{
	private MemberDao dao;
	
	@Autowired
	public MemberSelectCountMemberIdxReviewService(MemberDao dao) {
		this.dao = dao;
	}
	
	public int selectCountMemberIdxReview(MemberVo memberVo) {
		
		return dao.selectCountMemberIdxReview(memberVo);
	}
	
}