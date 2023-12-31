package com.crfr.service.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MypageDao;
import com.crfr.dao.ProductDao;
import com.crfr.vo.ExploreVo;

@Service("mpCount")
public class MypageCountService implements MypageService {
	private MypageDao dao;
	
	@Autowired
	public MypageCountService(MypageDao dao) {
		this.dao = dao;
	}
	
	public int selectmynonreviewCount(int member_idx) {
		return dao.selectmynonreviewCount(member_idx);
	}
	
	public int selectmyreviewCount(int member_idx) {
		return dao.selectmyreviewCount(member_idx);
	}
	
	public int selectdeliveryCount(int member_idx) {
		return dao.selectdeliveryCount(member_idx);
	}
	
	public int selectlikeListCount(int member_idx) {
		return dao.selectlikeListCount(member_idx);
	}
	
	public int selectproductinqCount(int member_idx) {
	return dao.selectproductinqCount(member_idx);
	}
	
	public int selectcouponListCount(int member_idx) {
	return dao.selectcouponListCount(member_idx);
	}
	
	public int selectconfirmCount(int member_idx) {
	return dao.selectconfirmCount(member_idx);
	}
	
}
