package com.crfr.service.member;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MemberDao;

@Service("mInsertCouponReview")
public class MemberInsertCouponReviewService implements MemberService{
	private MemberDao dao;
	
	@Autowired
	public MemberInsertCouponReviewService(MemberDao dao) {
		this.dao = dao;
	}
	
	public int insertCouponReview(int member_idx, Date date) {
		
		return dao.insertCouponReview(member_idx, date);
	}
	
}