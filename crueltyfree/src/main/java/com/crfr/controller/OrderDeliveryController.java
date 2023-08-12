package com.crfr.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crfr.service.orderDelivery.OrderDeliveryService;
import com.crfr.service.productView.ProductViewService;
import com.crfr.vo.FileVo;
import com.crfr.vo.MemberVo;
import com.crfr.vo.OrderListVo;
import com.crfr.vo.OrderProductVo;
import com.crfr.vo.OrderVo;
import com.crfr.vo.ProductVo;

import lombok.Setter;


@Controller
@RequestMapping("/mypage")
public class OrderDeliveryController {
	//서비스 클래스로 사용할 클래스들을 멤버변수로 정의하고 의존 자동 주입받도록 함
	@Setter(onMethod_={ @Autowired })	
	ProductViewService pSelectView, pSelectThumbnail;
	
	@Setter(onMethod_={ @Autowired })	
	OrderDeliveryService mSelectOrderVo, mSelectOrderProduct;
	
	@GetMapping("/mypage_orderinq.do")
	public String mypage_orderinq(Model model, String pageNum, String pageBlock, 
			HttpServletRequest request) {
		
		HttpSession session = request.getSession(); //세션에서 "member"를 얻어옴
		MemberVo memberVo = (MemberVo)session.getAttribute("member");
		int member_idx = 0;
		if(memberVo != null) {//마이페이지여서 member있어야 하지만 오류방지로 넣는 구문
			member_idx = memberVo.getMember_idx();
		}
		
		List<OrderListVo> orderList = new ArrayList<>(); // 빈 리스트로 초기화
		List<OrderVo> orderVoList = mSelectOrderVo.selectOrderVo(member_idx);//주문리스트 받아오기
		
		for(OrderVo orderVo : orderVoList) {
			int order_idx = orderVo.getOrder_idx();
					
			List<OrderProductVo> orderProductList = mSelectOrderProduct.selectOrderProduct(order_idx);
			for(OrderProductVo orderProductVo : orderProductList) {
				int product_idx = orderProductVo.getProduct_idx();
				ProductVo productVo = pSelectView.selectView(product_idx); //상품번호의 상품Vo
			    FileVo fileVo = pSelectThumbnail.selectThumbnail(product_idx); //상품번호의 파일Vo중 1번째
			    			    
			    OrderListVo orderListVo = new OrderListVo(); //OrderListVo 객체 생성
			    //주문idx,날짜,번호,상품썸네일,상품판매자,상품이름,구매개수,상품구매금액,주문진행상태
			    orderListVo.setOrder_idx(order_idx);
			    orderListVo.setOrder_date(orderVo.getOrder_date());
			    orderListVo.setOrder_num(orderVo.getOrder_num());
			    orderListVo.setOriginFile(fileVo.getOriginFile());
			    orderListVo.setSaveFile(fileVo.getSaveFile());
			    orderListVo.setMember_nickname(productVo.getMember_nickname());
			    orderListVo.setProduct_name(productVo.getProduct_name());
			    orderListVo.setProduct_price(productVo.getProduct_price());
			    orderListVo.setOrder_product_count(orderProductVo.getOrder_product_count());
			    orderListVo.setOrder_status(orderVo.getOrder_status());
			    orderListVo.setProduct_idx(product_idx);
			    
			    orderList.add(orderListVo); // basketList에 추가
			}//주문상품 for문 종료
		}//주문테이블vo for문 종료
		
		model.addAttribute("orderList", orderList); // basketList를 모델에 추가	
		return "mypage/mypage_orderinq";
	}
	
	@GetMapping("/mypage_cancelinq.do")
	public String mypage_cancelinq() {				
		return "mypage/mypage_cancelinq";
	}
	
}
