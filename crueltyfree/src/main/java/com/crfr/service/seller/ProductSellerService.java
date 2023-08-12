package com.crfr.service.seller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.crfr.vo.FileVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ProductInfoVo;
import com.crfr.vo.ProductVo;

public interface ProductSellerService {
	default PageNav setSellerPageNav(PageNav pageNav, String pageNum, String pageBlock) {return null;}
	
	// 입력을 위해 product_idx를 불러오는 서비스
	default int findProductIdx (String product_name, String member_nickname) {return 0;}
	
	// 입력 서비스
	default int insertFile (MultipartFile[] attachedFile, String product_idx, 
							HttpServletRequest request) {return 0;}
	default int insertProduct (String category_code, String category_code_small,
							String product_name, String product_price, String product_capa,
							String delivery_company, String member_nickname, String member_idx) {return 0;}
	default int insertProductInfo (String product_idx, String product_info_amount,
							String product_info_useMethod, String product_info_maker,
							String product_info_handphone) {return 0;}
	
	// 수정 서비스
	default List<ProductVo> checkProductList(String searchField, String searchWord){return null;}
	default int checkProductCount(String searchField, String searchWord) {return 0;}
	default int productUpdate (String category_code, String category_code_small,
							String product_name, String product_price, 
							String product_capa, String delivery_company, String member_nickname, 
							String member_idx, String product_idx) {return 0;}
	default int updateProductInfo (String product_info_amount,
							String product_info_useMethod, String product_info_maker,
							String product_info_handphone, String product_idx) {return 0;}
	
	// 수정 서비스 (파일)
	default int productUpdateFile0(MultipartFile attachedFile0, String file_idx, 
			HttpServletRequest request) {return 0;}
	default int productUpdateFile1(MultipartFile attachedFile1, String file_idx, 
			HttpServletRequest request) {return 0;}
	default int productUpdateFile2(MultipartFile attachedFile2, String file_idx, 
			HttpServletRequest request) {return 0;}
	default int productUpdateFile3(MultipartFile attachedFile3, String file_idx, 
			HttpServletRequest request) {return 0;}
	
	// 수정을 위해 기존 내용을 불러오는 서비스
	default ProductVo findProductPost(String product_idx) {return null;}
	default ProductInfoVo findProductInfoPost(String product_idx) {return null;}
	default List<FileVo> findProductFilePost(String product_idx) {return null;}
	
	// 파일 번호를 불러오는 서비스
	default List<FileVo> findProductFileIdx(String product_idx) {return null;}
	
	// 삭제 서비스
	default int deleteProduct(String product_idx, HttpServletRequest request) {return 0;}
}