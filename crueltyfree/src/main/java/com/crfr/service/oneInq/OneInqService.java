package com.crfr.service.oneInq;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.crfr.vo.FileVo;
import com.crfr.vo.NoticeVo;
import com.crfr.vo.OneInqVo;
import com.crfr.vo.OrderProductVo;
import com.crfr.vo.OrderVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ProductInfoVo;
import com.crfr.vo.ProductVo;
import com.crfr.vo.PurchaseListVo;

public interface OneInqService {
	default PageNav setSellerPageNav(PageNav pageNav, String pageNum, String pageBlock) {return null;}
	
	default PageNav setPageNav(PageNav pageNav, String pageNum, String pageBlock, NoticeVo vo) {return null;}
	default PageNav setPageNav2(PageNav pageNav, String pageNum, String pageBlock, OneInqVo vo) {return null;}
	// 공지사항 카운트
	default int checkNoticeCount(String notice_idx) {return 0;}
	
	default int insertNotice (MultipartFile attachedFile, String notice_title, 
				String notice_content, HttpServletRequest request) {return 0;}

	
	
	default List<NoticeVo> noticeList() {return null;}
			
	default int noticeListCount() {return 0;}
	
	default NoticeVo noticeView(int notice_idx) {return null;} 


	default int updatenotice(MultipartFile attachedFile, NoticeVo vo, HttpServletRequest request) {return 0;}

	default int deletenotice(int notice_idx) {return 0;}
	
	
	default int insertOneinq(OneInqVo vo) {return 0;}
	
	default int selectOneinq_idx(OneInqVo vo) {return 0;}
	
	default int insertOneinqimg (MultipartFile attachedFile,int selectOneinq_idx , HttpServletRequest request) {return 0;}
	
	default List<OneInqVo> oneinqList(OneInqVo vo) {return null;}
		
	default int oneinqListCount(OneInqVo vo) {return 0;}
	
	default int deleteoneinq(OneInqVo vo) {return 0;}
	
	default int deleteoneinqimg(OneInqVo vo) {return 0;}
	
	default int updateoneinq (OneInqVo vo) {return 0;}
	
//	// 입력을 위해 product_idx를 불러오는 서비스
//	default int findProductIdx (String product_name, String member_nickname) {return 0;}
//	
//	// 입력 서비스
//	default int insertFile (MultipartFile[] attachedFile, String product_idx, 
//							HttpServletRequest request) {return 0;}
//	default int insertProduct (String category_code, String category_code_small,
//							String product_name, String product_price, String product_capa,
//							String delivery_company, String member_nickname, String member_idx) {return 0;}
//	default int insertProductInfo (String product_idx, String product_info_amount,
//							String product_info_useMethod, String product_info_maker,
//							String product_info_handphone) {return 0;}
//	
//	// 수정 서비스
//	default List<ProductVo> checkProductList(String searchField, String searchWord, String member_idx) {return null;}
//	default int checkProductCount(String searchField, String searchWord, String member_idx) {return 0;}
//	default int productUpdate (String category_code, String category_code_small,
//							String product_name, String product_price, 
//							String product_capa, String delivery_company, String member_nickname, 
//							String member_idx, String product_idx) {return 0;}
//	default int updateProductInfo (String product_info_amount,
//							String product_info_useMethod, String product_info_maker,
//							String product_info_handphone, String product_idx) {return 0;}
//	
//	// 수정 서비스 (파일)
//	default int productUpdateFile0(MultipartFile attachedFile0, String file_idx, 
//			HttpServletRequest request) {return 0;}
//	default int productUpdateFile1(MultipartFile attachedFile1, String file_idx, 
//			HttpServletRequest request) {return 0;}
//	default int productUpdateFile2(MultipartFile attachedFile2, String file_idx, 
//			HttpServletRequest request) {return 0;}
//	default int productUpdateFile3(MultipartFile attachedFile3, String file_idx, 
//			HttpServletRequest request) {return 0;}
//	
//	// 수정을 위해 기존 내용을 불러오는 서비스
//	default ProductVo findProductPost(String product_idx) {return null;}
//	default ProductInfoVo findProductInfoPost(String product_idx) {return null;}
//	default List<FileVo> findProductFilePost(String product_idx) {return null;}
//	
//	// 파일 번호를 불러오는 서비스
//	default List<FileVo> findProductFileIdx(String product_idx) {return null;}
//	
//	// 삭제 서비스
//	default int deleteProduct(String product_idx, HttpServletRequest request) {return 0;}
	

}