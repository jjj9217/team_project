package com.crfr.service.member;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MemberDao;

@Service("mInsertCouponJoin")
public class MemberInsertCouponJoinService implements MemberService{
	private MemberDao dao;
	
	@Autowired
	public MemberInsertCouponJoinService(MemberDao dao) {
		this.dao = dao;
	}
	
	public int insertCouponJoin(int member_idx, Date date) {
		
		return dao.insertCouponJoin(member_idx, date);
	}
	
}