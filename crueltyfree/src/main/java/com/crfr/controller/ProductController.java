package com.crfr.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crfr.service.product.ProductService;
import com.crfr.service.purchase.PurchaseService;
import com.crfr.vo.BasketVo;
import com.crfr.vo.MemberVo;
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
	ProductService pSelectView, pSelectThumbnail;
	
	@GetMapping("/product_view.do")
	public String product_view() {		
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
	
}
