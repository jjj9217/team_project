package com.crfr.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.crfr.service.email.EmailService;
import com.crfr.service.productView.ProductViewService;
import com.crfr.service.purchase.PurchaseService;
import com.crfr.vo.BasketListVo;
import com.crfr.vo.BasketVo;
import com.crfr.vo.CouponVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.MemberVo;
import com.crfr.vo.OrderVo;
import com.crfr.vo.PayVo;
import com.crfr.vo.ProductVo;
import com.google.gson.Gson;

import lombok.Setter;


@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	//서비스 클래스로 사용할 클래스들을 멤버변수로 정의하고 의존 자동 주입받도록 함
	@Setter(onMethod_={ @Autowired })	
	PurchaseService bSelectCount, bSelectList, bPlusBasketCount, bMinusBasketCount, bUpdateBasketCount,
	bBasketInsert, bBasketDeleteOne, oSelectBasket, oSelectDeliveryCount,oSelectDeliveryList,
	oInsertDelivery, oSelectDeliveryVo, oInsertOrder, oSelectOrderIdx, oInsertPay, oDeleteBasket,
	oImportService, oInsertOrderProduct, oUpdateOrder, oUpdatePay, mSelectCountMember, oSelectCouponList,
	oDeleteCoupon, oSelectCouponCount, oInsertProductOut, oUpdateProductOutStatus, oSelectCountProductOutStatus;
	
	@Setter(onMethod_={ @Autowired })	
	ProductViewService pSelectView, pSelectThumbnail;
	
	@Setter(onMethod_={ @Autowired })	
	EmailService eSendOrderNum;
	
	//환불 테스트 페이지
	@GetMapping("/refund.do")
	public String refund() {		
		return "purchase/refund";
	}
	
	//환불하기 버튼
	@PostMapping("/refund_process.do")
	@ResponseBody
	public String refund_process(@RequestBody Map<String, String> refundMap) {
				
		String merchant_uid = refundMap.get("merchant_uid");
		String order_idx = refundMap.get("order_idx");
		String product_idx = refundMap.get("product_idx");
		String token = oImportService.getImportToken();
		
		int resultDlvIng = oSelectCountProductOutStatus.selectCountProductOutStatus(order_idx);
		
		String result = "";
		
		if(resultDlvIng != 0) {
			result = "dlv_ing";
		}else {
			int result_refund = oImportService.cancelPay(token, merchant_uid);
			
			System.out.println("token: "+token);
			System.out.println("merchant_uid: "+merchant_uid);
			System.out.println("result_refund: "+result_refund);
			
			if(result_refund == 1) {//성공시 결제 테이블,주문테이블 환불여부 바꾸기 -> order_idx받아오기
				oUpdateOrder.updateOrder(order_idx); //주문테이블 업데이트
				oUpdatePay.updatePay(order_idx); //결제테이블 업데이트
				
				int intOrderIdx = Integer.parseInt(order_idx);
				int intProductIdx = Integer.parseInt(product_idx);
				
				int updateResult = oUpdateProductOutStatus.updateProductOutStatus(intOrderIdx, intProductIdx);
				result = "success";			
			}else {
				result = "fail";
			}
		}
		
		
		return result;
	}
	
	//본인인증
	@PostMapping("/certifications_process.do")
	@ResponseBody
	public Object certifications_process(@RequestBody Map<String, String> refundMap) {
				
		String imp_uid = refundMap.get("imp_uid");
		String token = oImportService.getImportToken();
		Map<String, String> result = oImportService.getInfo(token, imp_uid);

		System.out.println("token: "+token);
		System.out.println("imp_uid: "+imp_uid);
		
		return result;
	}
	//장바구니 페이지
	@GetMapping("/basket.do")
	public String basket(HttpServletRequest request, Model model) {
		
		//세션에서 "member"를 얻어옴
		HttpSession session = request.getSession();
		MemberVo vo = (MemberVo)session.getAttribute("member");
		
		String client_num = null;
		if(vo != null) {//로그인 되어있을때
			client_num = Integer.toString(vo.getMember_idx());	//Vo의 member_idx를 넣음
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
			client_num = Integer.toString(vo.getMember_idx());	//Vo의 member_idx를 넣음
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
			client_num = Integer.toString(vo.getMember_idx());	//Vo의 member_idx를 넣음
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
			client_num = Integer.toString(vo.getMember_idx());	//Vo의 member_idx를 넣음
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
			client_num = Integer.toString(vo.getMember_idx());	//Vo의 member_idx를 넣음
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
	
	//주문/결제 페이지
	@PostMapping("/order.do")
	public String order(HttpServletRequest request, Model model) {
		
		//세션에서 "member"를 얻어옴
		HttpSession session = request.getSession();
		MemberVo vo = (MemberVo)session.getAttribute("member");
		
		String client_num = null;
		if(vo != null) {//로그인 되어있을때
			client_num = Integer.toString(vo.getMember_idx());	//Vo의 member_idx를 넣음				
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
		model.addAttribute("client_num", client_num);
		
		//쿠폰 목록 받아오기
		List<CouponVo> couponList = null;
		int couponCount = 0;
		if(vo != null) {
			int member_idx = vo.getMember_idx();
			Date today = new Date();
			System.out.println(today);
			couponList = oSelectCouponList.selectCouponList(member_idx, today);
			couponCount = oSelectCouponCount.selectCouponCount(member_idx, today);
		}
		model.addAttribute("couponCount", couponCount);
		model.addAttribute("couponList", couponList);
		
		//배송지 목록 받아오기	
		List<DeliveryVo> deliveryList = new ArrayList<>(); // 빈 리스트로 초기화
		DeliveryVo deliveryVo = null;
		//배송지 목록의 수
		int delivery_count =  oSelectDeliveryCount.selectDeliveryCount(client_num);
		model.addAttribute("delivery_count", delivery_count);
		//배송지목록
		if(vo != null) {//로그인 되어있을때
			deliveryList = oSelectDeliveryList.selectDeliveryList(client_num);		
			model.addAttribute("deliveryList", deliveryList); 
		}else {
			
			deliveryList.add(deliveryVo); // 비회원:deliveryList에 값이 null인 deliveryVo 1개추가
			model.addAttribute("deliveryList", deliveryList); 
		}
		
		
		String selectedValuesStr = request.getParameter("selectedValuesStr"); //JSon형식으로 받은것
		String[] selectedValues = new Gson().fromJson(selectedValuesStr, String[].class);//배열로 풀기
		
		String product_idx = request.getParameter("product_idx");
		String cart_cnt = request.getParameter("cart_cnt");
		
		List<BasketListVo> basketList = new ArrayList<>(); // 빈 리스트로 초기화. 구매목록
		int listCount = 0; //구매목록 개수
		int total_price = 0; //총 상품 금액
		int total_delivery = 0; //총 배송비용
		
		if(selectedValuesStr != null) {
			for (String selectedValue : selectedValues) {//String배열 값마다 처리
				//selectedValue = basket_idx
				BasketVo basketVo = oSelectBasket.selectBasket(selectedValue);
				
				int productIdx = basketVo.getProduct_idx(); //장바구니목록의 상품 번호를 얻음
			    ProductVo productVo = pSelectView.selectView(productIdx); //상품번호의 상품Vo
			    FileVo fileVo = pSelectThumbnail.selectThumbnail(productIdx); //상품번호의 파일Vo중 1번째
				
				BasketListVo basketListVo = new BasketListVo(); // BasketListVo 객체 생성
				
			    basketListVo.setBasket_idx(basketVo.getBasket_idx());
			    basketListVo.setProduct_idx(basketVo.getProduct_idx());
			    basketListVo.setOriginFile(fileVo.getOriginFile());
			    basketListVo.setSaveFile(fileVo.getSaveFile());
			    basketListVo.setMember_nickname(productVo.getMember_nickname());
			    basketListVo.setProduct_name(productVo.getProduct_name());
			    basketListVo.setProduct_price(productVo.getProduct_price());
			    basketListVo.setBasket_count(basketVo.getBasket_count());
			    basketListVo.setDelivery_company(productVo.getDelivery_company());	
				
				basketList.add(basketListVo); // basketList에 추가
				
				listCount++;
				total_price +=  productVo.getProduct_price() * basketVo.getBasket_count();
				total_delivery += productVo.getDelivery_company();
			}
		}else {
			int productIdx = Integer.parseInt(product_idx); //상품 번호
			int cartCnt = Integer.parseInt(cart_cnt); //상품 개수
			
		    ProductVo productVo = pSelectView.selectView(productIdx); //상품번호의 상품Vo
		    FileVo fileVo = pSelectThumbnail.selectThumbnail(productIdx); //상품번호의 파일Vo중 1번째
			
			BasketListVo basketListVo = new BasketListVo(); // BasketListVo 객체 생성
			
		    basketListVo.setProduct_idx(productIdx);
		    basketListVo.setOriginFile(fileVo.getOriginFile());
		    basketListVo.setSaveFile(fileVo.getSaveFile());
		    basketListVo.setMember_nickname(productVo.getMember_nickname());
		    basketListVo.setProduct_name(productVo.getProduct_name());
		    basketListVo.setProduct_price(productVo.getProduct_price());
		    basketListVo.setBasket_count(cartCnt);
		    basketListVo.setDelivery_company(productVo.getDelivery_company());	
			
			basketList.add(basketListVo); // basketList에 추가
			
			listCount++;
			total_price +=  productVo.getProduct_price() * cartCnt;
			total_delivery += productVo.getDelivery_company();
		}
		
		model.addAttribute("listCount", listCount); 
		model.addAttribute("total_price", total_price); 
		model.addAttribute("total_delivery", total_delivery); 
		model.addAttribute("basketList", basketList); // basketList를 모델에 추가
		return "purchase/order";
	}
	
	//주문완료페이지
	@PostMapping("/order_complete.do")
	public String order_complete(HttpServletRequest request, Model model) {	
		
		//세션에서 "member"를 얻어옴
		HttpSession session = request.getSession();
		MemberVo memberVo = (MemberVo)session.getAttribute("member");		
		
		String[] orderForm = new String[20];
		orderForm[0] = request.getParameter("client_num");
		orderForm[1] = request.getParameter("order_num");
		orderForm[2] = request.getParameter("order_name");
		orderForm[3] = request.getParameter("order_handphone");
		orderForm[4] = request.getParameter("order_prdPrice");
		orderForm[5] = request.getParameter("order_salePrice");
		orderForm[6] = request.getParameter("order_dlvPrice");
		orderForm[7] = request.getParameter("order_totalPrice");
		orderForm[8] = request.getParameter("delivery_address_name");
		orderForm[9] = request.getParameter("delivery_get_name");
		orderForm[10] = request.getParameter("delivery_handphone");
		orderForm[11] = request.getParameter("delivery_message");
		orderForm[12] = request.getParameter("delivery_pass");
		orderForm[13] = request.getParameter("delivery_pass_content");
		orderForm[14] = request.getParameter("delivery_postNum");
		orderForm[15] = request.getParameter("delivery_address");
		orderForm[16] = request.getParameter("delivery_address2");
		orderForm[17] = request.getParameter("pay_uid");
		orderForm[18] = request.getParameter("buyer_email");
		orderForm[19] = request.getParameter("coupon_idx");
		
		for(String test : orderForm) {
			System.out.println("테스트: "+test);
		}
		
		//배송지 정보 담을 vo객체 생성
		DeliveryVo deliveryVo = new DeliveryVo();
		
		if(memberVo != null) {//회원일때
			deliveryVo.setMember_idx(Integer.parseInt(orderForm[0]));			
		}else {//비회원일때
			deliveryVo.setDelivery_guest(orderForm[0]);
		}
		deliveryVo.setDelivery_address_name(orderForm[8]);
		deliveryVo.setDelivery_get_name(orderForm[9]);
		deliveryVo.setDelivery_handphone(orderForm[10]);
		deliveryVo.setDelivery_message(orderForm[11]);
		deliveryVo.setDelivery_pass(Integer.parseInt(orderForm[12]));
		deliveryVo.setDelivery_pass_content(orderForm[13]);
		deliveryVo.setDelivery_postNum(Integer.parseInt(orderForm[14]));
		deliveryVo.setDelivery_address(orderForm[15]);
		deliveryVo.setDelivery_address2(orderForm[16]);
		
		//주문 정보 담을 vo객체 생성
		OrderVo orderVo = new OrderVo();
		orderVo.setClient_num(orderForm[0]);
		orderVo.setOrder_num(orderForm[1]);
		orderVo.setOrder_name(orderForm[2]);
		orderVo.setOrder_handphone(orderForm[3]);
		orderVo.setOrder_prdPrice(Integer.parseInt(orderForm[4]));
		orderVo.setOrder_salePrice(Integer.parseInt(orderForm[5]));
		orderVo.setOrder_dlvPrice(Integer.parseInt(orderForm[6]));
		orderVo.setOrder_totalPrice(Integer.parseInt(orderForm[7]));
		
		
		int dlvInsertResult = 0;		
		DeliveryVo deliveryResult = null;
		if(memberVo == null) {//비회원인 경우
			//배송지 테이블 등록
			dlvInsertResult = oInsertDelivery.insertDelivery(deliveryVo);			
		}else {
			//deliveryVo의 정보로 테이블 검색
			deliveryResult = oSelectDeliveryVo.selectDeliveryVo(deliveryVo);
			if(deliveryResult == null) {//검색결과 0이면 등록
				dlvInsertResult = oInsertDelivery.insertDelivery(deliveryVo);
			}else {
				dlvInsertResult = 1;
			}
		}
		
		if(dlvInsertResult != 0) {
			//delivery_idx 불러오기
			deliveryResult = oSelectDeliveryVo.selectDeliveryVo(deliveryVo);
			int delivery_idx = deliveryResult.getDelivery_idx();
			//delivery_idx를 orderVo에 넣기
			orderVo.setDelivery_idx(delivery_idx);
		}
		
		//주문 테이블 등록
		int orderInsertResult = oInsertOrder.insertOrder(orderVo);
		
		int payInsertResult = 0;
		int order_idx = 0;
		if(orderInsertResult != 0) {
			//order_idx 불러오기
			order_idx = oSelectOrderIdx.selectOrderIdx(orderVo);
			//order_idx를 orderVo에 넣기
			orderVo.setOrder_idx(order_idx);
			
			//결제 정보 담을 vo객체 생성
			PayVo payVo = new PayVo();
			payVo.setOrder_idx(order_idx);
			payVo.setPay_price(Integer.parseInt(orderForm[7]));
			payVo.setPay_uid(orderForm[17]);
			
			//결제 테이블 등록
			payInsertResult = oInsertPay.insertPay(payVo);
		}
		
		String basketIdxValuesStr = request.getParameter("basketIdxStr"); //JSon형식으로 받은것
		System.out.println(basketIdxValuesStr);
		String[] basketIdxValues = new Gson().fromJson(basketIdxValuesStr, String[].class);//배열로 풀기
		
		String buyPrdIdx = request.getParameter("buyPrdIdx");//단일 구매 상품번호
		String buyCnt = request.getParameter("buyCnt");//단일 구매 수량
		
		String strOrderIdx = Integer.toString(order_idx);
		
		int deleteBasketResult = 0;
		String viewPage = "purchase/order";	
		
		if(payInsertResult != 0) {
			//주문성공시 비회원의 경우 이메일 발송
			if(memberVo == null) {
				eSendOrderNum.orderEmail(orderForm[18],orderForm[1]);				
			}
			
			if(basketIdxValues == null) {
				//단일구매 상품 주문상품 테이블에 등록하기
				int resultInsertOrderProduct = 
						oInsertOrderProduct.insertOrderProduct(strOrderIdx, buyPrdIdx, orderForm[0], buyCnt);
				//상품출고 테이블에 등록하기
				int resultInsertProductOut =
						oInsertProductOut.insertProductOut(strOrderIdx, buyPrdIdx, buyCnt);
			}else {
				for(String basket_idx : basketIdxValues) {		
					//장바구니에서 제거전에 주문상품테이블에 등록하기
					//장바구니 번호로 장바구니 정보 불러오기
					BasketVo basketVo = oSelectBasket.selectBasket(basket_idx);
					String basketPrdIdx = Integer.toString(basketVo.getProduct_idx());
					String basketCnt = Integer.toString(basketVo.getBasket_count());
					int resultInsertOrderProduct =
							oInsertOrderProduct.insertOrderProduct(strOrderIdx, basketPrdIdx, orderForm[0], basketCnt);
					//상품출고 테이블에 등록하기
					int resultInsertProductOut =
							oInsertProductOut.insertProductOut(strOrderIdx, basketPrdIdx, basketCnt);
					deleteBasketResult = oDeleteBasket.deleteBasket(basket_idx);					
				}				
			}
			
			//사용한 쿠폰삭제
			if(!orderForm[19].equals("0")) {
				int deleteCouponResult = oDeleteCoupon.deleteCoupon(orderForm[19]);
			}
			
			//모델에 추가
			model.addAttribute("orderResult", orderVo); 
			model.addAttribute("deliveryResult", deliveryVo); 
			viewPage = "purchase/order_complete";
		}
		
		return viewPage;
	}
	
	//회원정보 중복검사
	@PostMapping("/overlap_check.do")
	@ResponseBody
	public Object overlap_check(@RequestBody Map<String, String> refundMap) {
				
		String name = refundMap.get("name");
		String birthday = refundMap.get("birthday");
		String phone = refundMap.get("phone");
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("member_name", name);
		map.put("member_birthday", birthday);
		map.put("member_handphone", phone);
		
		int searchMemberCount = mSelectCountMember.selectCountMember(map);
		
		String result = null;
		
		if(searchMemberCount > 0) {
			result = "fail";
		}else {
			result = "success";
		}
		
		return result;
	}
}
