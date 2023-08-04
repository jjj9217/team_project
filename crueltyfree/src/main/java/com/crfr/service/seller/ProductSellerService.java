package com.crfr.service.seller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.crfr.vo.FileVo;
import com.crfr.vo.ProductVo;

public interface ProductSellerService {
	default ProductVo selectView (int Product_idx) {return null;}
	default int insertFile (MultipartFile attachedFile, String product_idx, 
							HttpServletRequest request) {return 0;}
	default int insertProduct (String category_code,
							String product_name, String product_price, String product_capa,
							String delivery_company, String member_nickname) {return 0;}
	default int insertProductInfo (String product_idx, String product_info_amount,
							String product_info_useMethod, String product_info_maker,
							String product_info_handphone) {return 0;}
	default void download (String originFile, String saveFile, HttpServletRequest request, 
							HttpServletResponse response) {}
}