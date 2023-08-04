package com.crfr.controller;

import java.util.ArrayList;
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
import com.crfr.vo.BasketListVo;
import com.crfr.vo.BasketVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.MemberVo;
import com.crfr.vo.ProductVo;

import lombok.Setter;


@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	//서비스 클래스로 사용할 클래스들을 멤버변수로 정의하고 의존 자동 주입받도록 함
	@Setter(onMethod_={ @Autowired })	
	PurchaseService bSelectCount, bSelectList, bPlusBasketCount, bMinusBasketCount, bUpdateBasketCount,
	bBasketInsert, bBasketDeleteOne;
	
	@Setter(onMethod_={ @Autowired })
	ProductService pSelectView, pSelectThumbnail;
	
	//장바구니 페이지
	@GetMapping("/basket.do")
	public String basket(HttpServletRequest request, Model model) {
		
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
		
		int basketCount = bSelectCount.selectCount(client_num);//장바구니 수		
		model.addAttribute("basketCount",basketCount);
		
		List<BasketVo> basketVoList = bSelectList.selectList(client_num);//장바구니 목록
		
		List<BasketListVo> basketList = new ArrayList<>(); // 빈 리스트로 초기화
		
		for (BasketVo basketVo : basketVoList) {
		    int product_idx = basketVo.getProduct_idx(); //장바구니목록의 상품 번호를 얻음
		    ProductVo productVo = pSelectView.selectView(product_idx); //상품번호의 상품Vo
		    FileVo fileVo = pSelectThumbnail.selectThumbnail(product_idx); //상품번호의 파일Vo중 1번째
		    
		    BasketListVo basketListVo = new BasketListVo(); // BasketListVo 객체 생성
		    
		    basketListVo.setBasket_idx(basketVo.getBasket_idx());
		    basketListVo.setProduct_idx(productVo.getProduct_idx());
		    basketListVo.setOriginFile(fileVo.getOriginFile());
		    basketListVo.setSaveFile(fileVo.getSaveFile());
		    basketListVo.setMember_nickname(productVo.getMember_nickname());
		    basketListVo.setProduct_name(productVo.getProduct_name());
		    basketListVo.setProduct_price(productVo.getProduct_price());
		    basketListVo.setBasket_count(basketVo.getBasket_count());
		    basketListVo.setDelivery_company(productVo.getDelivery_company());	
		    basketListVo.setProduct_capa(productVo.getProduct_capa());
		    
		    basketList.add(basketListVo); // basketList에 추가
		}
		
		model.addAttribute("basketList", basketList); // basketList를 모델에 추가		
		return "purchase/basket";
	}
	
	//장바구니 수량 + 버튼
	@PostMapping("/basket_count_plus.do")
	@ResponseBody
	public String basket_count_plus(HttpServletRequest request, @RequestParam("product_idx") int product_idx,
			@RequestParam("basket_count") int basket_count) {
		
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
		
		String result = null;
		ProductVo productVo = pSelectView.selectView(product_idx);//상품번호의 상품Vo
		int product_capa = productVo.getProduct_capa();//상품의 재고수량
		if(product_capa != 0 && product_capa > basket_count) {
			//상품수량이 0이 아니고, 재고량이 장바구니수량보다 클때			
			bPlusBasketCount.plusBasketCount(product_idx, client_num);//장바구니 수량 +1 업데이트			
			result="success";
		}else {
			result ="fail";
		}
		return result;		
	}
	
	//장바구니 수량 - 버튼
	@PostMapping("/basket_count_minus.do")
	@ResponseBody
	public String basket_count_minus(HttpServletRequest request, @RequestParam("product_idx") int product_idx,
			@RequestParam("basket_count") int basket_count) {
		
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
		
		String result = null;
		ProductVo productVo = pSelectView.selectView(product_idx);//상품번호의 상품Vo
		int product_capa = productVo.getProduct_capa();//상품의 재고수량
		if(product_capa != 0 && basket_count > 0) {
			//상품수량이 0이 아니고, 장바구니수량이 0보다 클때			
			bMinusBasketCount.minusBasketCount(product_idx, client_num);//장바구니 수량 -1 업데이트			
			result="success";
		}else {
			result ="fail";
		}
		return result;		
	}	
	
	//장바구니 수량 직접입력 버튼
	@PostMapping("/basket_count_update.do")
	@ResponseBody
	public String basket_count_update(HttpServletRequest request, @RequestParam("product_idx") int product_idx,
			@RequestParam("basket_count") int basket_count) {
		
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
		
		String result = null;
		ProductVo productVo = pSelectView.selectView(product_idx);//상품번호의 상품Vo
		int product_capa = productVo.getProduct_capa();//상품의 재고수량
		if(product_capa != 0 && basket_count > 0 && product_capa >= basket_count) {
			//상품수량이 0이 아니고, 장바구니수량이 0보다 크고, 재고량이 장바구니수량보다 클때				
			bUpdateBasketCount.updateBasketCount(product_idx, basket_count, client_num);//장바구니 수량 업데이트			
			result="success";
		}else {
			result ="fail";
		}
		return result;		
	}		
	
	//상품 개별 삭제 버튼
	@PostMapping("/basket_delete_one.do")
	public String basket_delete_one(@RequestParam("basket_idx") String basket_idx, 
			RedirectAttributes redirectAttributes) {
		
		int result = bBasketDeleteOne.basketDeleteOne(basket_idx);	

		if(result == 1) {
			 redirectAttributes.addFlashAttribute("successMessage", "상품을 장바구니에서 삭제하였습니다.");			
		}else {
			redirectAttributes.addFlashAttribute("errorMessage", "상품 삭제에 실패하였습니다.");
		}
		return "redirect:basket.do";
	}
	
	//상품 선택 삭제 버튼
	@PostMapping("/basket_delete_multiple.do")
	@ResponseBody
	public String basket_delete_multiple(@RequestParam("basket_idxs[]") String[] basket_idxs) {
		String result = null;			
	    int delete_result = 0;
	    
	    for (String basket_idx : basket_idxs) {
	        delete_result = bBasketDeleteOne.basketDeleteOne(basket_idx);
	    }
		if(delete_result != 0) {
			result="success";
		}else {
			result="fail";
		}
		return result;
	}
	
	//품절 상품 삭제 버튼
	@PostMapping("/basket_delete_soldout.do")
	@ResponseBody
	public String basket_delete_soldout(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		
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
		
		List<BasketVo> basketVoList = bSelectList.selectList(client_num);//장바구니 목록
		
		int result = 0;
		
		for (BasketVo basketVo : basketVoList) {
		    int product_idx = basketVo.getProduct_idx(); //장바구니목록의 상품 번호를 얻음
		    ProductVo productVo = pSelectView.selectView(product_idx);//상품번호의 상품Vo
		    int product_capa = productVo.getProduct_capa();
		    if(product_capa == 0) {
		    	String basket_idx = String.valueOf(basketVo.getBasket_idx());//장바구니번호
		    	result = bBasketDeleteOne.basketDeleteOne(basket_idx);
		    }
		}
		String message = null;
		if(result == 1) {
			message="success";		
		}else {
			message="fail";
		}
		
		return message;
	}
	
	@GetMapping("/order.do")
	public String order() {		
		return "purchase/order";
	}
		
	
	@GetMapping("/order_complete.do")
	public String order_complete() {		
		return "purchase/order_complete";
	}
}
