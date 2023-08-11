package com.crfr.service.seller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.crfr.vo.ProductVo;

public interface ProductSellerService {
	default int findProductIdx (String product_name, String member_nickname) {return 0;}
	default int insertFile (MultipartFile attachedFile, String product_idx, 
							HttpServletRequest request) {return 0;}
	default int insertProduct (String category_code, String category_code_small,
							String product_name, String product_price, String product_capa,
							String delivery_company, String member_nickname, String member_idx) {return 0;}
	default int insertProductInfo (String product_idx, String product_info_amount,
							String product_info_useMethod, String product_info_maker,
							String product_info_handphone) {return 0;}
}