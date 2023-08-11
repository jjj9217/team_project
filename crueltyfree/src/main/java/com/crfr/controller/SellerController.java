package com.crfr.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.crfr.service.seller.ProductSellerService;
import com.crfr.vo.FileVo;
import com.crfr.vo.MemberVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ProductInfoVo;
import com.crfr.vo.ProductVo;

import lombok.Setter;

@Controller
@RequestMapping("/seller")
public class SellerController {
	//서비스 클래스로 사용할 클래스들을 멤버변수로 정의하고 의존 자동 주입받도록 함
	@Setter(onMethod_={ @Autowired })
	ProductSellerService pInsertFile, pInsertProduct, pInsertProductInfo, pfindProductIdx,
	cProductList, cProductCount, sPageNavSet, 
	pfineProductPost, pfineProductInfoPost, // findProductFilePost,
	pUpdateProduct, pUpdateProductInfo, pfineProductFilePost,
	pUpdateProductFile0, pUpdateProductFile1, pUpdateProductFile2, pUpdateProductFile3,
	pfindProductFileIdx,
	pDeleteProduct;
	
	@Setter(onMethod_={ @Autowired })
	PageNav pageNav;
	
	@GetMapping("/sale_stats.do")
	public String sale_stats() {		
		return "seller/sale_stats";
	}
	
	@GetMapping("/purchase_history.do")
	public String purchase_history() {
		return "seller/purchase_history";
	}
	
	@GetMapping("/confirm_inq.do")
	public String confirm_inq() {		
		return "seller/confirm_inq";
	}
	
	// 등록 상품 목록 확인
	@GetMapping("/check_pro.do")
	public String check_pro(String searchField, String searchWord, 
					   String pageNum, String pageBlock, Model model) {
		
		//게시판 목록을 가져오는 요청에 대한 처리를 위한 CheckProductListService 클래스 이용
		List<ProductVo> checkProList = cProductList.checkProductList(searchField, searchWord);
		model.addAttribute("checkProList", checkProList);
		
		//페이지네비게이션을 위해 SellerPageNavService클래스를 이용
		//총 레코드 수를 가져오기 위해 CheckProductCountService클래스 이용
		int totRows = cProductCount.checkProductCount(searchField, searchWord);
		pageNav.setTotalRows(totRows);
		pageNav = sPageNavSet.setSellerPageNav(pageNav, pageNum, pageBlock);
		model.addAttribute("pageNav", pageNav);
		
		return "seller/check_pro";
	}
	
	// 상품 등록 요청 처리
	@GetMapping("/regi_pro.do")
	public String regi_pro() {		
		return "seller/regi_pro";
	}
	
	// 상품 등록 처리
	@PostMapping("/regi_pro_process.do")
	public String regi_pro_process(@RequestParam("attachedFile") MultipartFile[] attachedFile,
			@RequestParam("member_nickname") String member_nickname,
			@RequestParam("member_idx") String member_idx,
			String category_code, String category_code_small, String product_name, String product_price,
			String product_capa, String delivery_company, String product_info_amount,
			String product_info_useMethod, String product_info_maker,
			String product_info_handphone, HttpServletRequest request) {
		
		String viewPage = "seller/regi_pro"; //글등록 실패시 보여지는 페이지
		
		//작성 내용을 ProductInsertService 클래스를 이용하여 저장
		int result1 = pInsertProduct.insertProduct (category_code, category_code_small, product_name, 
				product_price, product_capa, delivery_company, member_nickname, member_idx);

		int productIdx = pfindProductIdx.findProductIdx(product_name, member_nickname);
		
		String product_idx = String.valueOf(productIdx); 
		
		int result2 = pInsertProductInfo.insertProductInfo (product_idx, product_info_amount,
				product_info_useMethod, product_info_maker, product_info_handphone);
		
		int result3 = pInsertFile.insertFile(attachedFile, product_idx, request);
		
		if(result1 == 1 && result2 == 1 && result3 == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:/seller/check_pro.do";
		}
		
		return viewPage;
	}
	
	// 상품 수정 화면 요청 처리
	@GetMapping("/edit_pro.do")
	public String edit_pro(@RequestParam("no") String product_idx, Model model) {
		//게시물 가져오기 - ProductSelectPostService 클래스 이용
		ProductVo vo1 = pfineProductPost.findProductPost(product_idx);
		model.addAttribute("ProductVo", vo1);
		ProductInfoVo vo2 = pfineProductInfoPost.findProductInfoPost(product_idx);
		model.addAttribute("ProductInfoVo", vo2);
//		List<FileVo> vo3 = pfineProductFilePost.findProductFilePost(product_idx);
//		model.addAttribute("FileVo", vo3);
		
		return "seller/edit_pro";
	}
	
	// 상품 수정 요청 처리
	@PostMapping("/edit_pro_process.do")
	public String edit_process(String category_code, String product_name, String product_price,
			String product_capa, String delivery_company, 
			@RequestParam("member_nickname") String member_nickname,
			@RequestParam("member_idx") String member_idx,
			@RequestParam("product_idx") String product_idx,
			String product_info_amount, String product_info_useMethod, String product_info_maker,
			String product_info_handphone,
			@RequestParam("attachedFile0") MultipartFile attachedFile0,
			@RequestParam("attachedFile1") MultipartFile attachedFile1,
			@RequestParam("attachedFile2") MultipartFile attachedFile2,
			@RequestParam("attachedFile3") MultipartFile attachedFile3,
			HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");
		member_nickname = mVo.getMember_nickname();
		member_idx = String.valueOf(mVo.getMember_idx());

		String viewPage = "seller/edit_pro"; //글수정 실패시 보여지는 페이지
		System.out.println("멤버번호:"+member_idx);
		System.out.println("멤버닉네임:"+member_nickname);
		//첨부파일과 함께 글내용 수정을 BoardFileUpdateService클래스 이용
		int result1 = pUpdateProduct.productUpdate(category_code, product_name, 
				product_price, product_capa, delivery_company, member_nickname, 
				member_idx, product_idx);
		int result2 = pUpdateProductInfo.updateProductInfo (product_info_amount,
				product_info_useMethod, product_info_maker, product_info_handphone,
				product_idx);
		
		
		List<FileVo> fileidx = pfindProductFileIdx.findProductFileIdx(product_idx); 
		int i = 0;
		for (FileVo fileVo: fileidx) {
			String file_Idx = Integer.toString(fileVo.getFile_idx());
			if(i == 0) {
				int file_result0 = pUpdateProductFile0.productUpdateFile0(attachedFile0, file_Idx, request);
				if(attachedFile0.isEmpty()) {
					System.out.println("ㅠㅏ일널");
				}else {
					System.out.println("ㅇㅇㅇ");
				}
				System.out.println(file_Idx);
				System.out.println(file_result0);
			}else if(i == 1) {
				int file_result1 = pUpdateProductFile1.productUpdateFile1(attachedFile1, file_Idx, request);
				if(attachedFile1.isEmpty()) {
					System.out.println("ㅠㅏ일널");
				}else {
					System.out.println("ㅇㅇㅇ");
				}
				System.out.println(file_Idx);
				System.out.println(file_result1);
			}else if(i == 2) {
				int file_result2 = pUpdateProductFile2.productUpdateFile2(attachedFile2, file_Idx, request);
				if(attachedFile2.isEmpty()) {
					System.out.println("ㅠㅏ일널");
				}else {
					System.out.println("ㅇㅇㅇ");
				}
				System.out.println(file_Idx);
				System.out.println(file_result2);
			}else {
				int file_result3 = pUpdateProductFile3.productUpdateFile3(attachedFile3, file_Idx, request);
				if(attachedFile3.isEmpty()) {
					System.out.println("ㅠㅏ일널");
				}else {
					System.out.println("ㅇㅇㅇ");
				}
				System.out.println(file_Idx);
				System.out.println(file_result3);
			}
			i++;
		}
/*	
		for (int i = 0; i < fileidx.size(); i++) {
			if(i == 0) {
				pUpdateProductFile0.productUpdateFile0(attachedFile0, fileidx[i], request);
			}else if(i == 1) {
				pUpdateProductFile1.productUpdateFile1(attachedFile1, fileidx[i], request);
			}else if(i == 2) {
				pUpdateProductFile2.productUpdateFile2(attachedFile2, fileidx[i], request);
			}else {
				pUpdateProductFile3.productUpdateFile3(attachedFile3, fileidx[i], request);
			}
		}
*/		

//		if(!attachedFile0.isEmpty()) {
//			서비스0 = 상품이름검색해서 나온 파일 중 0번 교체
//		}

		if(result1 == 1 && result2 == 1) { //글 수정 성공시 보여지는 페이지
			System.out.println("테스트");
			System.out.println("파일번호 : ");
			viewPage = "redirect:/seller/check_pro.do";	
		}

		return viewPage;
	}
	
	// 상품 삭제 요청 처리
	@PostMapping("/delete_pro_process.do")
	public String delete_process(@RequestParam("product_idx") String product_idx, HttpServletRequest request) {
		//request객체는 세션에 저장된 회원번호를 알아내기 위해 필요함

		//글삭제 요청 처리를 위해 BoardFileDeleteService 클래스 이용
		int result1 = pDeleteProduct.deleteProduct(product_idx, request);

		String viewPage = "seller/check_pro";
		
		if(result1 == 1) {//글삭제 성공 시
			viewPage = "redirect:/seller/check_pro.do";
		}
			
		return viewPage;
	}
}
