package com.crfr.service.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.crfr.vo.CouponVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.LikeExploreVo;
import com.crfr.vo.MemberVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ProductInqVo;
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
	
	default List<DeliveryVo> selectdeliveryList(int member_idx) {return null;}
	
	default public int selectdeliveryCount(int member_idx) {return 0;}
	
	default int insertdeliveryPost(DeliveryVo vo) {return 0;}
	
	default int insertdeliveryPost_normal(DeliveryVo vo) {return 0;}
	
	default int deletedeliveryPost(DeliveryVo vo) {return 0;}
	
	default int updatedeliveryPostdefault (DeliveryVo vo) {return 0;}
	
	default int updatedeliveryPostchangedefault(DeliveryVo vo) {return 0;}
	
	default DeliveryVo selectVieweditdelivery(int delivery_idx) {return null;}
	
	default int updatedeliveryPost(DeliveryVo vo) {return 0;}
	
	default int changepassword(MemberVo vo) {return 0;}
	
	default List<FileVo> selectlikeListimg(int member_idx) {return null;}

	default List<LikeExploreVo> selectlikeList(int member_idx) {return null;}
	
	default int selectlikeListCount(int member_idx) {return 0;}
	
	default int deletelike(LikeExploreVo vo) {return 0;}
	
	default int deletelikeall(LikeExploreVo vo) {return 0;}

	default List<FileVo> reviewRegList(FileVo vo) {return null;}
	
	default int updatereview(ReviewVo vo) {return 0;}
	
	default int updatereviewimg0(MultipartFile[] attachedFile,
			   HttpServletRequest request, int searchReview_idx) {return 0;}
	
	default int updatereviewimg1(MultipartFile[] attachedFile,
			   HttpServletRequest request, int searchReview_idx) {return 0;}
	
	default int updatereviewimg2(MultipartFile[] attachedFile,
			   HttpServletRequest request, int searchReview_idx) {return 0;}
	
	default int updatereviewimg3(MultipartFile[] attachedFile,
			   HttpServletRequest request, int searchReview_idx) {return 0;}
	
	default int updatereviewimg4(MultipartFile[] attachedFile,
			   HttpServletRequest request, int searchReview_idx) {return 0;}
	
	default List<FileVo> selectproductinqListimg(int member_idx) {return null;}
		
	default List<ProductInqVo> selectproductinqList(int member_idx) {return null;}
	
	default int selectproductinqCount(int member_idx) {return 0;}
	
	default List<CouponVo> selectcouponList(int member_idx) {return null;}
	
	default int selectcouponListCount(int member_idx) {return 0;}
	
	default int deleteinq(ProductInqVo vo) {return 0;}
	
	default int updateproductinq (ProductInqVo vo) {return 0;}
	
	default List<ReviewVo> reviewRegList2(ReviewVo vo) {
		return null;}
	
}