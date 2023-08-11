package com.crfr.service.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MypageDao;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.LikeExploreVo;
import com.crfr.vo.ReviewExploreVo;
import com.crfr.vo.ReviewVo;

@Service("mpList")
public class MypageListService implements MypageService {
	private MypageDao dao;
	
	@Autowired
	public MypageListService(MypageDao dao) {
		this.dao = dao;
	}
	
	public List<FileVo> selectmynonreviewListimg(int member_idx) {
		return dao.selectmynonreviewListimg(member_idx);	
	}
	
	public List<ReviewExploreVo> selectmynonreviewList(int member_idx) {
		return dao.selectmynonreviewList(member_idx);	
	}
	
	public List<FileVo> selectmyreviewListimg(int member_idx) {
		return dao.selectmyreviewListimg(member_idx);	
	}
	
	public List<ReviewExploreVo> selectmyreviewList(int member_idx) {
		return dao.selectmyreviewList(member_idx);	
	}
	
	public List<DeliveryVo> selectdeliveryList(int member_idx) {
		return dao.selectdeliveryList(member_idx);	
	}
	
	public List<FileVo> selectlikeListimg(int member_idx) {
		return dao.selectlikeListimg(member_idx);
	}
	
	public List<LikeExploreVo> selectlikeList(int member_idx) {
		return dao.selectlikeList(member_idx);
	}
	
	public List<FileVo> reviewRegList(FileVo vo) {
	return dao.reviewRegList(vo);
	}
	
	
	public List<ReviewVo> reviewRegList2(ReviewVo vo) {
		return dao.reviewRegList2(vo);
		}
	
}
