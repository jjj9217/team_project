package com.crfr.controller;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crfr.service.orderDelivery.OrderDeliveryService;
import com.crfr.service.productView.ProductViewService;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.MemberVo;
import com.crfr.vo.OrderListVo;
import com.crfr.vo.OrderProductVo;
import com.crfr.vo.OrderVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ProductVo;

import lombok.Setter;


@Controller
@RequestMapping("/mypage")
public class OrderDeliveryController {
	//서비스 클래스로 사용할 클래스들을 멤버변수로 정의하고 의존 자동 주입받도록 함
	@Setter(onMethod_={ @Autowired })	
	ProductViewService pSelectView, pSelectThumbnail, pviPage, pvrPage;
	
	@Setter(onMethod_={ @Autowired })	
	OrderDeliveryService mSelectOrderVo, mSelectOrderProduct, mSelectOrderCount, mSelectCountPayEd,
	mSelectCountDlvIng, mSelectCountDlvEd, mSelectRefund, mSelectRefundCount, mSelectOrderView
	,mSelectDelivery, mSelectPayEdCount, mSelectDlvIngCount, mSelectDlvEdCount, mSelectDlvStatus;
	
	PageNav pageNav1 = new PageNav();
	PageNav pageNav2 = new PageNav();
	
	//주문/배송조회
	@GetMapping("/mypage_orderinq.do")
	public String mypage_orderinq(Model model, String pageNum, String pageBlock, 
			HttpServletRequest request) {
		
		HttpSession session = request.getSession(); //세션에서 "member"를 얻어옴
		MemberVo memberVo = (MemberVo)session.getAttribute("member");
		int member_idx = 0;
		if(memberVo != null) {//마이페이지여서 member있어야 하지만 오류방지로 넣는 구문
			member_idx = memberVo.getMember_idx();
		}		
		
		// 날짜세팅
		String month = request.getParameter("month");

		Timestamp timestamp_begin = null;
		Timestamp timestamp_end = null;

		if (month != null) {
		    LocalDateTime localDateTime = null;
		    LocalDate today = LocalDate.now();

		    if (month.equals("1")) {
		        // 오늘 날짜에 1개월을 빼서 설정
		        LocalDate oneMonthAgo = today.minusMonths(1);
		        localDateTime = oneMonthAgo.atStartOfDay();
		    } else if (month.equals("3")) {
		        // 오늘 날짜에 3개월을 빼서 설정
		        LocalDate threeMonthsAgo = today.minusMonths(3);
		        localDateTime = threeMonthsAgo.atStartOfDay();
		    } else if (month.equals("6")) {
		        // 오늘 날짜에 6개월을 빼서 설정
		        LocalDate sixMonthsAgo = today.minusMonths(6);
		        localDateTime = sixMonthsAgo.atStartOfDay();
		    } else if (month.equals("12")) {
		        // 오늘 날짜에 12개월을 빼서 설정
		        LocalDate twelveMonthsAgo = today.minusMonths(12);
		        localDateTime = twelveMonthsAgo.atStartOfDay();
		    }

		    // 오늘 날짜에 1일을 더해서 timestamp_end 설정
		    timestamp_end = Timestamp.valueOf(today.plusDays(1).atStartOfDay());

		    // LocalDateTime을 java.sql.Timestamp로 변환하여 timestamp_begin 설정
		    timestamp_begin = Timestamp.valueOf(localDateTime);
		} else {
		    LocalDate today = LocalDate.now();

		    // 오늘 날짜에 1개월을 빼서 설정
		    LocalDate oneMonthAgo = today.minusMonths(1);
		    LocalDateTime localDateTime = oneMonthAgo.atStartOfDay();

		    // LocalDateTime을 java.sql.Timestamp로 변환하여 timestamp_begin 설정
		    timestamp_begin = Timestamp.valueOf(localDateTime);

		    // 오늘 날짜에 1일을 더해서 timestamp_end 설정
		    timestamp_end = Timestamp.valueOf(today.plusDays(1).atStartOfDay());
		}
		
		
		//주문배송조회 정보제공용 카운트 수(주문건 단위)
		int payEd = mSelectCountPayEd.selectCountPayEd(member_idx, timestamp_begin, timestamp_end);
		int dlvIng = mSelectCountDlvIng.selectCountDlvIng(member_idx, timestamp_begin, timestamp_end);
		int dlvEd = mSelectCountDlvEd.selectCountDlvEd(member_idx, timestamp_begin, timestamp_end);
		
//		//모델에 세팅
//		model.addAttribute("payEd", payEd);
//		model.addAttribute("dlvIng", dlvIng);
//		model.addAttribute("dlvEd", dlvEd);
		
		// 오늘 날짜
		LocalDateTime now = LocalDateTime.now();
		String formattedDateTime = now.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
		model.addAttribute("today", formattedDateTime);
		
		List<OrderVo> orderVoList = mSelectOrderVo.selectOrderVo(member_idx, timestamp_begin, timestamp_end);//주문리스트 받아오기
		
		List<List<OrderListVo>> orderList = new ArrayList<>(); //order기준 리스트세팅
		
		List<Integer> orderProductCounts = new ArrayList<>();
		
		int payEdCount = 0;
		int dlvIngCount = 0;
		int dlvEdCount = 0;
		
		for(OrderVo orderVo : orderVoList) {
			int order_idx = orderVo.getOrder_idx();
			int count = 0; 		
			List<OrderProductVo> orderProduct = mSelectOrderProduct.selectOrderProduct(order_idx);
			List<OrderListVo> orderProductList = new ArrayList<>();//리스트1개에 담길 리스트생성
			for(OrderProductVo orderProductVo : orderProduct) {
				int product_idx = orderProductVo.getProduct_idx();
				ProductVo productVo = pSelectView.selectView(product_idx); //상품번호의 상품Vo
			    FileVo fileVo = pSelectThumbnail.selectThumbnail(product_idx); //상품번호의 파일Vo중 1번째
			    
			    //주문배송조회 정보제공용 카운트 수(상품건 단위)
			    int selectPayEd = mSelectPayEdCount.selectPayEdCount(order_idx, product_idx, timestamp_begin, timestamp_end);
			    int selectDlvIng = mSelectDlvIngCount.selectDlvIngCount(order_idx, product_idx, timestamp_begin, timestamp_end);
			    int selectDlvEd = mSelectDlvEdCount.selectDlvEdCount(order_idx, product_idx, timestamp_begin, timestamp_end);
			    
			    payEdCount = payEdCount + selectPayEd;
			    dlvIngCount = dlvIngCount + selectDlvIng;
			    dlvEdCount = dlvEdCount + selectDlvEd;
			    		
			    OrderListVo orderListVo = new OrderListVo(); //OrderListVo 객체 생성
			    //주문idx,날짜,번호,상품썸네일,상품판매자,상품이름,구매개수,상품구매금액,주문진행상태
			    orderListVo.setOrder_idx(order_idx);
			    
			    Date orderDate = orderVo.getOrder_date(); // SQL 검색 결과에서 가져온 order_date 값
			    // 주문 날짜에 9시간을 더한 후, Date로 변환하여 저장
			    Date adjustedDate = new Date(orderDate.getTime() - (9 * 60 * 60 * 1000)); // 9시간을 밀리초로 변환하여 뺌
			    
			    int prdDlvStatus = mSelectDlvStatus.selectDlvStatus(order_idx, product_idx, timestamp_begin, timestamp_end);
			    
			    orderListVo.setOrder_date(adjustedDate);	
			    orderListVo.setOrder_num(orderVo.getOrder_num());
			    orderListVo.setOriginFile(fileVo.getOriginFile());
			    orderListVo.setSaveFile(fileVo.getSaveFile());
			    orderListVo.setMember_nickname(productVo.getMember_nickname());
			    orderListVo.setProduct_name(productVo.getProduct_name());
			    orderListVo.setProduct_price(productVo.getProduct_price());
			    orderListVo.setOrder_product_count(orderProductVo.getOrder_product_count());
			    orderListVo.setOrder_status(orderVo.getOrder_status());
			    orderListVo.setProduct_idx(product_idx);
			    orderListVo.setOrder_ing(orderVo.getOrder_ing());
			    orderListVo.setProduct_out_status(prdDlvStatus);
			    
			    orderProductList.add(orderListVo); // 주문상품리스트에 추가
			    count++;
			}//주문상품 for문 종료
			orderProductCounts.add(count); // count 값을 리스트에 추가
			orderList.add(orderProductList);//주문상품 리스트를 주문리스트에 추가
		}//주문테이블vo for문 종료
		
		//모델에 세팅
		model.addAttribute("payEdCount", payEdCount);
		model.addAttribute("dlvIngCount", dlvIngCount);
		model.addAttribute("dlvEdCount", dlvEdCount);
		
		model.addAttribute("orderProductCounts", orderProductCounts); // 상품수를 모델에 추가
		model.addAttribute("orderList", orderList); // 주문리스트를 모델에 추가	
		
		//페이징
		int orderCount = mSelectOrderCount.selectOrderCount(member_idx, timestamp_begin, timestamp_end); //페이징에 사용할 리스트 수
		pageNav1.setTotalRows(orderCount); //게시물 수 세팅
		pageNav1 = pviPage.setPageNav(pageNav1, pageNum, pageBlock);
		model.addAttribute("mPageNav", pageNav1); //문의 페이지 네비게이션 모델에 추가
		
		System.out.println(timestamp_begin);
		System.out.println(timestamp_end);
		System.out.println(orderCount);
		return "mypage/mypage_orderinq";
	}
	
	//반품/취소 조회
	@GetMapping("/mypage_cancelinq.do")
	public String mypage_cancelinq(Model model, String pageNum, String pageBlock, 
			HttpServletRequest request) {
		
		HttpSession session = request.getSession(); //세션에서 "member"를 얻어옴
		MemberVo memberVo = (MemberVo)session.getAttribute("member");
		int member_idx = 0;
		if(memberVo != null) {//마이페이지여서 member있어야 하지만 오류방지로 넣는 구문
			member_idx = memberVo.getMember_idx();
		}		
		
		// 날짜세팅
		String month = request.getParameter("month");

		Timestamp timestamp_begin = null;
		Timestamp timestamp_end = null;

		if (month != null) {
		    LocalDateTime localDateTime = null;
		    LocalDate today = LocalDate.now();

		    if (month.equals("1")) {
		        // 오늘 날짜에 1개월을 빼서 설정
		        LocalDate oneMonthAgo = today.minusMonths(1);
		        localDateTime = oneMonthAgo.atStartOfDay();
		    } else if (month.equals("3")) {
		        // 오늘 날짜에 3개월을 빼서 설정
		        LocalDate threeMonthsAgo = today.minusMonths(3);
		        localDateTime = threeMonthsAgo.atStartOfDay();
		    } else if (month.equals("6")) {
		        // 오늘 날짜에 6개월을 빼서 설정
		        LocalDate sixMonthsAgo = today.minusMonths(6);
		        localDateTime = sixMonthsAgo.atStartOfDay();
		    } else if (month.equals("12")) {
		        // 오늘 날짜에 12개월을 빼서 설정
		        LocalDate twelveMonthsAgo = today.minusMonths(12);
		        localDateTime = twelveMonthsAgo.atStartOfDay();
		    }

		    // 오늘 날짜에 1일을 더해서 timestamp_end 설정
		    timestamp_end = Timestamp.valueOf(today.plusDays(1).atStartOfDay());

		    // LocalDateTime을 java.sql.Timestamp로 변환하여 timestamp_begin 설정
		    timestamp_begin = Timestamp.valueOf(localDateTime);
		} else {
		    LocalDate today = LocalDate.now();

		    // 오늘 날짜에 1개월을 빼서 설정
		    LocalDate oneMonthAgo = today.minusMonths(1);
		    LocalDateTime localDateTime = oneMonthAgo.atStartOfDay();

		    // LocalDateTime을 java.sql.Timestamp로 변환하여 timestamp_begin 설정
		    timestamp_begin = Timestamp.valueOf(localDateTime);

		    // 오늘 날짜에 1일을 더해서 timestamp_end 설정
		    timestamp_end = Timestamp.valueOf(today.plusDays(1).atStartOfDay());
		}
		
		// 오늘 날짜
		LocalDateTime now = LocalDateTime.now();
		String formattedDateTime = now.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
		model.addAttribute("today", formattedDateTime);
		
		List<OrderVo> orderVoList = mSelectRefund.selectRefund(member_idx, timestamp_begin, timestamp_end);//취소/반품 주문리스트 받아오기
		
		List<List<OrderListVo>> orderList = new ArrayList<>(); //order기준 리스트세팅
		
		List<Integer> orderProductCounts = new ArrayList<>();
		
		for(OrderVo orderVo : orderVoList) {
			int order_idx = orderVo.getOrder_idx();
			int count = 0; 		
			List<OrderProductVo> orderProduct = mSelectOrderProduct.selectOrderProduct(order_idx);
			List<OrderListVo> orderProductList = new ArrayList<>();//리스트1개에 담길 리스트생성
			for(OrderProductVo orderProductVo : orderProduct) {				
				int product_idx = orderProductVo.getProduct_idx();
				ProductVo productVo = pSelectView.selectView(product_idx); //상품번호의 상품Vo
			    FileVo fileVo = pSelectThumbnail.selectThumbnail(product_idx); //상품번호의 파일Vo중 1번째
			    			    
			    OrderListVo orderListVo = new OrderListVo(); //OrderListVo 객체 생성
			    //주문idx,날짜,번호,상품썸네일,상품판매자,상품이름,구매개수,상품구매금액,주문진행상태
			    orderListVo.setOrder_idx(order_idx);
			    
			    Date orderDate = orderVo.getOrder_date(); // SQL 검색 결과에서 가져온 order_date 값
			    // 주문 날짜에 9시간을 더한 후, Date로 변환하여 저장
			    Date adjustedDate = new Date(orderDate.getTime() - (9 * 60 * 60 * 1000)); // 9시간을 밀리초로 변환하여 뺌

			    orderListVo.setOrder_date(adjustedDate);	
			    orderListVo.setOrder_num(orderVo.getOrder_num());
			    orderListVo.setOriginFile(fileVo.getOriginFile());
			    orderListVo.setSaveFile(fileVo.getSaveFile());
			    orderListVo.setMember_nickname(productVo.getMember_nickname());
			    orderListVo.setProduct_name(productVo.getProduct_name());
			    orderListVo.setProduct_price(productVo.getProduct_price());
			    orderListVo.setOrder_product_count(orderProductVo.getOrder_product_count());
			    orderListVo.setOrder_status(orderVo.getOrder_status());
			    orderListVo.setProduct_idx(product_idx);
			    orderListVo.setOrder_ing(orderVo.getOrder_ing());
			    orderProductList.add(orderListVo); // 주문상품리스트에 추가
			    count++;
			}//주문상품 for문 종료
			orderProductCounts.add(count); // count 값을 리스트에 추가
			orderList.add(orderProductList);//주문상품 리스트를 주문리스트에 추가
		}//주문테이블vo for문 종료
		
		model.addAttribute("orderProductCounts", orderProductCounts); // 상품수를 모델에 추가
		model.addAttribute("orderList", orderList); // 주문리스트를 모델에 추가	
		
		//페이징
		int orderCount = mSelectRefundCount.selectRefundCount(member_idx, timestamp_begin, timestamp_end); //페이징에 사용할 리스트 수
		pageNav2.setTotalRows(orderCount); //게시물 수 세팅
		pageNav2 = pvrPage.setPageNav(pageNav2, pageNum, pageBlock);
		model.addAttribute("mPageNav", pageNav2); //문의 페이지 네비게이션 모델에 추가
		
		return "mypage/mypage_cancelinq";
	}
	
	//주문 상세보기
	@GetMapping("/mypage_orderinq_view.do")
	public String mypage_orderinq_view(@RequestParam("ordNum") String order_num, Model model,
			HttpServletRequest request) {
		
		OrderVo orderView = mSelectOrderView.selectOrderView(order_num);//주문 1건 받아오기
		
		if(orderView != null) {		
		List<OrderListVo> orderList = new ArrayList<>();//리스트1개에 담길 리스트생성
		
		int order_idx = orderView.getOrder_idx();
		List<OrderProductVo> orderProduct = mSelectOrderProduct.selectOrderProduct(order_idx);
		
		int count=0;
		for(OrderProductVo orderProductVo : orderProduct) {//상품수만큼 반복		
			int product_idx = orderProductVo.getProduct_idx();
			ProductVo productVo = pSelectView.selectView(product_idx); //상품번호의 상품Vo
		    FileVo fileVo = pSelectThumbnail.selectThumbnail(product_idx); //상품번호의 파일Vo중 1번째
		    			    
		    OrderListVo orderListVo = new OrderListVo(); //OrderListVo 객체 생성
		    //주문idx,날짜,번호,상품썸네일,상품판매자,상품이름,구매개수,상품구매금액,주문진행상태
		    orderListVo.setOrder_idx(order_idx);
		    
		    Date orderDate = orderView.getOrder_date(); // SQL 검색 결과에서 가져온 order_date 값
		    // 주문 날짜에 9시간을 더한 후, Date로 변환하여 저장
		    Date adjustedDate = new Date(orderDate.getTime() - (9 * 60 * 60 * 1000)); // 9시간을 밀리초로 변환하여 뺌

		    orderListVo.setOrder_date(adjustedDate);	
		    orderListVo.setOrder_num(orderView.getOrder_num());
		    orderListVo.setOriginFile(fileVo.getOriginFile());
		    orderListVo.setSaveFile(fileVo.getSaveFile());
		    orderListVo.setMember_nickname(productVo.getMember_nickname());
		    orderListVo.setProduct_name(productVo.getProduct_name());
		    orderListVo.setProduct_price(productVo.getProduct_price());
		    orderListVo.setOrder_product_count(orderProductVo.getOrder_product_count());
		    orderListVo.setOrder_status(orderView.getOrder_status());
		    orderListVo.setProduct_idx(product_idx);
		    orderListVo.setOrder_ing(orderView.getOrder_ing());
		    orderListVo.setOrder_prdPrice(orderView.getOrder_prdPrice());
		    orderListVo.setOrder_salePrice(orderView.getOrder_salePrice());
		    orderListVo.setOrder_dlvPrice(orderView.getOrder_dlvPrice());
		    orderListVo.setOrder_totalPrice(orderView.getOrder_totalPrice());
		    orderList.add(orderListVo); // 주문상품리스트에 추가
		    count++;
		}//주문상품 for문 종료
		System.out.println(count);
		model.addAttribute("orderListCount", count);
		model.addAttribute("orderList", orderList); // 주문리스트를 모델에 추가			
		
		int delivery_idx = orderView.getDelivery_idx(); //배송지번호 받아오기
		
		DeliveryVo deliveryVo = mSelectDelivery.selectDelivery(delivery_idx);//배송지 정보 받아오기
		
		model.addAttribute("deliveryVo", deliveryVo); //배송지 모델에 추가
		}else {
			String errmsg = "주문번호를 잘못 입력하셨습니다.";
			model.addAttribute("errmsg", errmsg);
		}
		
		return "mypage/mypage_orderinq_view";
	}
}
