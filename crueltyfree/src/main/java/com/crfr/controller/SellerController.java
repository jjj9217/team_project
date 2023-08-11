package com.crfr.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.crfr.service.seller.ProductInsertService;
import com.crfr.vo.ProductVo;

import lombok.Setter;

@Controller
@RequestMapping("/seller")
public class SellerController {
	//서비스 클래스로 사용할 클래스들을 멤버변수로 정의하고 의존 자동 주입받도록 함
	@Setter(onMethod_={ @Autowired })
	ProductInsertService pInsertFile, pInsertProduct, pInsertProductInfo, pfindProductIdx;
	
	// @Setter(onMethod_={ @Autowired })
	// PageNav pageNav;
	
	@GetMapping("/sale_stats.do")
	public String sale_stats() {		
		return "seller/stats";
	}
	
	@GetMapping("/purchase_history.do")
	public String purchase_history() {
		return "seller/purchase_history";
	}
	
	@GetMapping("/confirm_inq.do")
	public String confirm_inq() {		
		return "seller/confirm_inq";
	}
	
	@GetMapping("/check_pro.do")
	public String check_pro() {		
		return "seller/check_pro";
	}
	
	// 상품 등록 요청 처리
	@GetMapping("/regi_pro.do")
	public String regi_pro() {		
		return "seller/regi_pro";
	}
	
	// 상품 등록 처리
	@PostMapping("/regi_pro_process.do")
	public String regi_pro_process(@RequestParam("attachedFile") List<MultipartFile> attachedFile,
			@RequestParam("member_nickname") String member_nickname,
			@RequestParam("member_idx") String member_idx,
			String category_code, String category_code_small, String product_name, String product_price,
			String product_capa, String delivery_company, String product_info_amount,
			String product_info_useMethod, String product_info_maker,
			String product_info_handphone, HttpServletRequest request) {
		
		System.out.println("받은 카테고리코드:"+category_code);
		System.out.println("받은 카테고리코드 소분류:"+category_code_small);
		
		
		String viewPage = "seller/regi_pro"; //글등록 실패시 보여지는 페이지
			
		//작성 내용을 ProductInsertService 클래스를 이용하여 저장
		int result1 = pInsertProduct.insertProduct (category_code, category_code_small, product_name, 
				product_price, product_capa, delivery_company, member_nickname, member_idx);

		int productIdx = pfindProductIdx.findProductIdx(product_name, member_nickname);
				
		System.out.println("ㅌㅅㅌ"+productIdx);
		
		String product_idx = String.valueOf(productIdx); 
		
		int result2 = pInsertProductInfo.insertProductInfo (product_idx, product_info_amount,
				product_info_useMethod, product_info_maker, product_info_handphone);
		
		if(result1 == 1 && result2 == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:#.do";
		}
		
		return viewPage;
	}
}
