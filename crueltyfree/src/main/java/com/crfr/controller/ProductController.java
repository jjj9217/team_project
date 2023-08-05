package com.crfr.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.crfr.service.product.ProductService;
import com.crfr.service.purchase.PurchaseService;
import com.crfr.vo.BasketVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.LikeVo;
import com.crfr.vo.MemberVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ProductInfoVo;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ProductVo;

import lombok.Setter;


@Controller
@RequestMapping("/product")
public class ProductController {

	//서비스 클래스로 사용할 클래스들을 멤버변수로 정의하고 의존 자동 주입받도록 함
	@Setter(onMethod_={ @Autowired })	
	PurchaseService bSelectCount, bSelectList, bPlusBasketCount, bMinusBasketCount, bUpdateBasketCount,
	bBasketInsert, bPlusBasketMultipleCount;
	
	@Setter(onMethod_={ @Autowired })	
	ProductService pSelectView, pSelectThumbnail, pSelectFile, pSelectProductInfo, pSelectProductInq,
	pSelectProductInqCount, pInsertProductInq, pUpdateProductInq, pDeleteProductInq, pSelectLike,
	pInsertLike, pDeleteLike, pviPage, pSelectReviewCount;		
	
	PageNav pageNav = new PageNav();
	
	//상품 상세보기
	@GetMapping("/product_view.do")
	public String product_view(@RequestParam("prdNum") int product_idx, Model model,
			String pageNum, String pageBlock, HttpServletRequest request) {
		
		//상품정보
		ProductVo productVo = pSelectView.selectView(product_idx);//상품번호의 상품Vo
		List<FileVo> fileVoList = pSelectFile.selectFile(product_idx); //상품번호의 파일Vo		
		ProductInfoVo productInfoVo = pSelectProductInfo.selectInfo(product_idx); //상품번호의 상품정보Vo
		
		model.addAttribute("productVo", productVo); //상품Vo를 모델에 추가
		model.addAttribute("fileVoList", fileVoList); //fileVoList를 모델에 추가
		model.addAttribute("productInfoVo", productInfoVo); //productInfoVo를 모델에 추가
		
		//좋아요
		HttpSession session = request.getSession(); //세션에서 "member"를 얻어옴
		MemberVo vo = (MemberVo)session.getAttribute("member");
		LikeVo likeVo = null;
		if(vo != null) {
			int member_idx = vo.getMember_idx();
			likeVo = pSelectLike.selectLike(product_idx, member_idx);			
		}
		model.addAttribute("likeVo", likeVo); //likeVo를 모델에 추가. 비회원은 null
		
		//상품문의리스트
		int productInqRows = pSelectProductInqCount.selectProductInqCount(product_idx);//상품문의 게시글 수
		List<ProductInqVo> productInqList  = pSelectProductInq.selectProductInq(product_idx); //상품번호의 상품문의 리스트
				
		model.addAttribute("productInqRows", productInqRows); //productInqRows를 모델에 추가
		model.addAttribute("productInqList", productInqList); //productInqList를 모델에 추가
		
		//상품문의 페이지 네비게이션
		pageNav.setTotalRows(productInqRows); //게시물 수 세팅
		pageNav = pviPage.setPageNav(pageNav, pageNum, pageBlock);
		model.addAttribute("pviPageNav", pageNav); //문의 페이지 네비게이션 모델에 추가
		
		//리뷰리스트
		int productReviewRows = pSelectReviewCount.selectReviewCount(product_idx);//상품의 리뷰 수
		
		model.addAttribute("productReviewRows", productReviewRows); //리뷰수 모델에 추가
		//리뷰 페이지 네비게이션
		
		return "product/product_view";
		
	}
	
	//장바구니 목록 추가 버튼(장바구니 담기)
	@PostMapping("/basket_insert.do")
	@ResponseBody
	public String basket_insert(HttpServletRequest request, @RequestParam("product_idx") int product_idx,
			@RequestParam("prd_cart_cnt") int prd_cart_cnt) {
		String result = null;
		
		//세션에서 "member"를 얻어옴
		HttpSession session = request.getSession();
		MemberVo vo = (MemberVo)session.getAttribute("member");
		
		String client_num = null;
		if(vo != null) {//로그인 되어있을때
			client_num = vo.getMember_id();	//Vo의 member_id를 넣음
		}else {//로그인 되어있지 않을때
		    Cookie[] cookies = request.getCookies(); //쿠키를 불러와서
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if ("guestId".equals(cookie.getName())) { //이름이 "guestId"인 쿠키의 value를
		            	client_num  = cookie.getValue();	//client_num에 넣음
		                break;
		            }//end of if - cookie 이름 조건문
		        }//end of for
		    }//end of if - cookie null값 조건문
		}	
		
		ProductVo productVo = pSelectView.selectView(product_idx);//상품번호의 상품Vo
		int product_capa = productVo.getProduct_capa();//상품의 재고수량
		
		List<BasketVo> basketVoList = bSelectList.selectList(client_num);//장바구니 목록
		int basket_count = 0; //장바구니 수량을 받을 변수
		
		for (BasketVo basketVo : basketVoList) {
		    int basket_product_idx = basketVo.getProduct_idx(); //장바구니목록의 상품 번호를 얻음
		    if(product_idx == basket_product_idx ) {//현재상품번호와 장바구니목록의 상품번호가 같다면
		    	basket_count = basketVo.getBasket_count(); //장바구니 수량 입력
		    	break;
		    }		    
		}
		
		if(basket_count == 0) { //0일때: 장바구니에 상품이 없을때
			int basketInsert = 0;
			basketInsert = bBasketInsert.basketInsert(product_idx, prd_cart_cnt, client_num); //장바구니에 Insert
			if(product_capa == 0) {//insert성공일때
				result = "soldout";
			}else if(basketInsert == 1){ //재고수량 0일때
				result="success";
			}else {//insert실패일때
				result="fail";
			}
		} else { //0이 아닐때: 장바구니에 상품이 있을때
			if(product_capa != 0 && product_capa >= (basket_count + prd_cart_cnt)) {
				//상품수량이 0이 아니고, 재고량이 장바구니수량보다 클때			
				bPlusBasketMultipleCount.plusBasketMultipleCount(product_idx, prd_cart_cnt, client_num);
				//장바구니 수량 + prd_cart_cnt 업데이트			
				result="success";
			}else if(product_capa == 0){
				result = "soldout";
			}else {
				result = String.valueOf(product_capa - basket_count); //실패시 담을수 있는 수량을 전송				
			}
		}
		
		return result;
	}
	
	//상품문의 등록 버튼
	@PostMapping("/product_inq_write.do")
	public String product_inq_write(String member_idx, String product_idx, String product_inq_content, 
			String member_nickname, RedirectAttributes redirectAttributes) {
		
		String viewPage = null;
		
		int result = pInsertProductInq.insertProductInq(member_idx, product_idx, product_inq_content, member_nickname);
		
		if(result == 1) {//등록 성공시
			 redirectAttributes.addFlashAttribute("inqSuccess", "상품 문의를 등록하였습니다.");			
		}else {
			redirectAttributes.addFlashAttribute("inqError", "상품 문의 등록을 실패하였습니다.");
		}
		return "redirect:product_view.do?prdNum="+product_idx;
	}
	
	//상품문의 수정 버튼
	@PostMapping("/product_inq_update.do")
	public String product_inq_update(String product_inq_idx, String product_idx, 
			String product_inq_content, RedirectAttributes redirectAttributes) {
		
		int result = pUpdateProductInq.updateProductInq(product_inq_idx, product_inq_content);
		
		if(result == 1) {//수정 성공시
			 redirectAttributes.addFlashAttribute("inqSuccess", "상품 문의 수정을 성공하였습니다.");			
		}else {
			redirectAttributes.addFlashAttribute("inqError", "상품 문의 수정을 실패하였습니다.");
		}
		return "redirect:product_view.do?prdNum="+product_idx;
	}
	
	//상품문의 삭제 버튼
	@PostMapping("/product_inq_delete.do")
	public String product_inq_delete(String product_inq_idx, String product_idx,
			RedirectAttributes redirectAttributes) {
		
		int result = pDeleteProductInq.deleteProductInq(product_inq_idx);
		
		if(result == 1) {//삭제 성공시
			 redirectAttributes.addFlashAttribute("inqSuccess", "상품 문의 삭제를 성공하였습니다.");			
		}else {
			redirectAttributes.addFlashAttribute("inqError", "상품 문의 삭제를 실패하였습니다.");
		}
		return "redirect:product_view.do?prdNum="+product_idx;
	}	
	
	//좋아요 등록
	@PostMapping("/like_insert.do")
	@ResponseBody
	public String like_insert(@RequestParam("member_idx") String member_idx, 
			@RequestParam("product_idx") String product_idx) {
		String msg = null;
		
		int result = pInsertLike.insertlike(product_idx, member_idx); 
		
		if(result == 1){//등록 성공시
			msg = "success";
		}else { //등록 실패시
			msg = "fail";
		}
		return msg;
	}
	
	//좋아요 삭제
	@PostMapping("/like_delete.do")
	@ResponseBody
	public String like_delete(@RequestParam("member_idx") String member_idx, 
			@RequestParam("product_idx") String product_idx) {
		String msg = null;
		
		int result = pDeleteLike.deletelike(product_idx, member_idx); 
		
		if(result == 1){//삭제 성공시
			msg = "success";
		}else { //삭제 실패시
			msg = "fail";
		}
		return msg;
	}
	
}
