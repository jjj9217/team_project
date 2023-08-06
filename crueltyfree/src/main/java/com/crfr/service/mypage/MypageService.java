package com.crfr.service.mypage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.crfr.vo.FileVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ReviewExploreVo;
import com.crfr.vo.ReviewVo;


public interface MypageService {
	default List<FileVo> selectmynonreviewListimg(int member_idx) {return null;}

	default List<ReviewExploreVo> selectmynonreviewList(int member_idx) {return null;}		

	default PageNav setPageNav(PageNav pageNav, String pageNum, String pageBlock, int member_idx) {return null;}
	
	default int selectmynonreviewCount(int member_idx) {return 0;}
	
	default List<FileVo> selectmyreviewListimg(int member_idx) {return null;}
	
	default List<ReviewExploreVo> selectmyreviewList(int member_idx) {return null;}
	
	default int selectmyreviewCount(int member_idx) {return 0;}
	
	default int insertreview(ReviewVo vo) {return 0;}
	
	default int selectReview_idx(ReviewVo vo) {return 0;}
	
	default int insertreviewimg(MultipartFile[] attachedFile, HttpServletRequest request,int searchReview_idx) {return 0;}	


}