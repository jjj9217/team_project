package com.crfr.service.mypage;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MypageDao;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.LikeExploreVo;
import com.crfr.vo.MemberVo;
import com.crfr.vo.ProductInqVo;


@Service("mpDelete")
public class MypageDeleteService implements MypageService {
	private MypageDao dao;
	
	@Autowired
	public MypageDeleteService(MypageDao dao) {
		this.dao = dao;
	}
	
	public int deletedeliveryPost(DeliveryVo vo) {
		return dao.deletedeliveryPost(vo);}
	
	public int deletelike(LikeExploreVo vo) {
		return dao.deletelike(vo);
	}
	
	public int deletelikeall(LikeExploreVo vo) {
		return dao.deletelikeall(vo);
	}
	
	public int deleteinq(ProductInqVo vo) {
		return dao.deleteinq(vo);
	}
	
	public int deletereviewimg0(FileVo vo) {
		return dao.deletereviewimg0(vo);
	}
	
	public int deletereviewimg1(FileVo vo) {
		return dao.deletereviewimg1(vo);
	}
	
	public int deletereviewimg2(FileVo vo) {
		return dao.deletereviewimg2(vo);
	}
	
	public int deletereviewimg3(FileVo vo) {
		return dao.deletereviewimg3(vo);
	}
	
	public int deletereviewimg4(FileVo vo) {
		return dao.deletereviewimg4(vo);
	}
	
	public int checkreviewimg0(FileVo vo) {
		return dao.checkreviewimg0(vo);
	}
	
	public int checkreviewimg1(FileVo vo) {
		return dao.checkreviewimg1(vo);
	}
	
	public int checkreviewimg2(FileVo vo) {
		return dao.checkreviewimg2(vo);
	}
	
	public int checkreviewimg3(FileVo vo) {
		return dao.checkreviewimg3(vo);
	}
	
	public int checkreviewimg4(FileVo vo) {
		return dao.checkreviewimg4(vo);
	}
	
	public int withdrawmember(MemberVo vo) {
		return dao.withdrawmember(vo);
	}
	
}
