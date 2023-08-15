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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.crfr.service.productView.ProductViewService;
import com.crfr.service.purchase.PurchaseService;
import com.crfr.vo.BasketVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.LikeVo;
import com.crfr.vo.MemberVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ProductInfoVo;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ProductVo;
import com.crfr.vo.RecentViewVo;
import com.crfr.vo.ReviewListVo;
import com.crfr.vo.ReviewRecomVo;
import com.crfr.vo.ReviewVo;

import lombok.Setter;


@Controller
@RequestMapping("/product")
public class ProductViewController {

	//서비스 클래스로 사용할 클래스들을 멤버변수로 정의하고 의존 자동 주입받도록 함
	@Setter(onMethod_={ @Autowired })	
	PurchaseService bSelectCount, bSelectList, bPlusBasketCount, bMinusBasketCount, bUpdateBasketCount,
	bBasketInsert, bPlusBasketMultipleCount;
	
	@Setter(onMethod_={ @Autowired })	
	ProductViewService pSelectView, pSelectThumbnail, pSelectFile, pSelectProductInfo, pSelectProductInq,
	pSelectProductInqCount, pInsertProductInq, pUpdateProductInq, pDeleteProductInq, pSelectLike,
	pInsertLike, pDeleteLike, pviPage, pvrPage,pSelectReviewCount, pSelectReviewListCount, pSelectReviewList,
	pSelectReviewImage, pSelectReviewRecom, pSelectReviewVo, pInsertRecom, pDeleteRecom,
	pSelectRecom, pUpdateRecom, pSelectRecentView, pInsertRecentView;		
	
	PageNav pageNav1 = new PageNav();
	PageNav pageNav2 = new PageNav();
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
		
		//최근본상품추가
		String client_num = null;
		Cookie[] cookies = request.getCookies(); //쿠키를 불러와서
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if ("guestId".equals(cookie.getName())) { //이름이 "guestId"인 쿠키의 value를
	            	client_num  = cookie.getValue();	//client_num에 넣음
	                break;
	            }//end of if - cookie 이름 조건문
	        }//end of for
	    }//end of if - cookie null값 조건문
		
	    RecentViewVo recentViewVo = pSelectRecentView.selectRecentView(client_num, product_idx);
	    if(recentViewVo == null) {//최근본상품아니면 테이블에 추가
	    	int insertRecentView = pInsertRecentView.insertRecentView(client_num, product_idx);
	    }
	    
		//상품문의리스트
		int productInqRows = pSelectProductInqCount.selectProductInqCount(product_idx);//상품문의 게시글 수
		List<ProductInqVo> productInqList  = pSelectProductInq.selectProductInq(product_idx); //상품번호의 상품문의 리스트
	    for(ProductInqVo productInqVo : productInqList) {
	    	Date date = productInqVo.getProduct_inq_regDate(); // SQL 검색 결과에서 가져온 date 값
	    	// 주문 날짜에 9시간을 뺀 후, Date로 변환하여 저장
	    	Date adjustedDate = new Date(date.getTime() - (9 * 60 * 60 * 1000)); // 9시간을 밀리초로 변환하여 뺌		
	    	productInqVo.setProduct_inq_regDate(adjustedDate);
	    }
		
	    model.addAttribute("productInqRows", productInqRows); //productInqRows를 모델에 추가
		model.addAttribute("productInqList", productInqList); //productInqList를 모델에 추가
		
		//상품문의 페이지 네비게이션
		pageNav1.setTotalRows(productInqRows); //게시물 수 세팅
		pageNav1 = pviPage.setPageNav(pageNav1, pageNum, pageBlock);
		model.addAttribute("pviPageNav", pageNav1); //문의 페이지 네비게이션 모델에 추가
		
		//리뷰리스트
		int productReviewRows = pSelectReviewCount.selectReviewCount(product_idx);//상품의 전체리뷰 수	
		model.addAttribute("productReviewRows", productReviewRows); //전체리뷰수 모델에 추가
		
		//평점 평균 세팅
		List<ReviewVo> ReviewList = pSelectReviewVo.selectReviewVo(product_idx);//상품번호 전체리뷰불러오기
		int sumReviewScore = 0;
		int reviewCount = 0;
		for(ReviewVo reviewVo : ReviewList) {			
			sumReviewScore += reviewVo.getReview_score();
			if(reviewVo.getReview_score() != 0) {
				reviewCount++;
			}
		}
		double roundedAvg = 0;
		if(sumReviewScore != 0) {
			roundedAvg = (double) Math.round(sumReviewScore / reviewCount * 10) / 10;		
		}
		model.addAttribute("reviewScoreAvg", roundedAvg); //전체리뷰평점평균 모델에 추가
		
		//사용자로부터 받은 조건을 Map에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		String sortOrder = request.getParameter("sortOrder");
		String textReview = request.getParameter("textReview");
		String photoReview = request.getParameter("photoReview");
		
		map.put("product_idx", product_idx);
		if(sortOrder != null){
		    map.put("sortOrder", sortOrder);
		}
		if(textReview != null){
		    map.put("textReview", textReview);
		}
		if(photoReview != null){
		    map.put("photoReview", photoReview);
		}
		int reviewListCount = pSelectReviewListCount.selectReviewListCount(map); //조건에 맞는 수(페이징용)
		
		List <ReviewListVo> reviewList = new ArrayList<>(); // 리뷰목록 구성할 리스트 초기화
				
		List<ReviewVo> reviewVoList = pSelectReviewList.selectReviewList(map); //조건에 맞는 리스트Vo
		
		
		for(ReviewVo reviewVo : reviewVoList) {
			int review_idx = reviewVo.getReview_idx(); 
			
			ReviewListVo reviewListVo = new ReviewListVo(); //세팅할 Vo 생성
			
			//리뷰번호로 이미지파일 받기
			List<FileVo> reviewImgList = pSelectReviewImage.selectReviewImage(review_idx);
			int fileIndex = 0;
			for(FileVo fileVo : reviewImgList) {				
				String originFile = fileVo.getOriginFile();
				String saveFile = fileVo.getSaveFile();
				
				reviewListVo.setOriginFile(fileIndex, originFile);
				reviewListVo.setSaveFile(fileIndex, saveFile);
				
				fileIndex++;
			}
			ReviewRecomVo reviewRecomVo = null;
			if(vo != null) {
				int member_idx = vo.getMember_idx();
				reviewRecomVo = pSelectReviewRecom.selectReviewRecom(review_idx, member_idx);
				if(reviewRecomVo != null) {
					reviewListVo.setReview_recom_idx(reviewRecomVo.getReview_recom_idx());					
				}
			}//회원 추천했는지 안했는지 확인용
			
			reviewListVo.setReview_idx(review_idx);
			reviewListVo.setMember_idx(reviewVo.getMember_idx());
			reviewListVo.setProduct_idx(reviewVo.getProduct_idx());
			reviewListVo.setReview_score(reviewVo.getReview_score());
			reviewListVo.setReview_content(reviewVo.getReview_content());
	    	Date date = reviewVo.getReview_regDate(); // SQL 검색 결과에서 가져온 date 값
	    	// 주문 날짜에 9시간을 뺀 후, Date로 변환하여 저장
	    	Date adjustedDate = new Date(date.getTime() - (9 * 60 * 60 * 1000)); // 9시간을 밀리초로 변환하여 뺌		
	    	reviewListVo.setReview_regDate(adjustedDate);
			reviewListVo.setReview_regDate(reviewVo.getReview_regDate());
			reviewListVo.setMember_nickname(reviewVo.getMember_nickname());
			reviewListVo.setReview_recom_count(reviewVo.getReview_recom_count());
			
			reviewList.add(reviewListVo);
			
			
		}
		model.addAttribute("reviewListCount", reviewListCount); //조건에 맞는 리뷰리스트수 모델에추가
		model.addAttribute("reviewList", reviewList); //조건에 맞는 리뷰리스트 모델에추가
		
		//리뷰 페이지 네비게이션
		pageNav2.setTotalRows(reviewListCount); //게시물 수 세팅
		pageNav2 = pvrPage.setPageNav(pageNav2, pageNum, pageBlock);
		model.addAttribute("pvrPageNav", pageNav2); //문의 페이지 네비게이션 모델에 추가
				
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
	
	//추천 등록
	@PostMapping("/recom_insert.do")
	@ResponseBody
	public String recom_insert(@RequestParam("member_idx") String member_idx, 
			@RequestParam("review_idx") String review_idx) {
		String msg = null;
		
		int result = pInsertRecom.insertRecom(review_idx, member_idx); 
		int recomCount = pSelectRecom.selectRecom(review_idx);
		pUpdateRecom.updateRecom(review_idx, recomCount);
		
		if(result == 1){//등록 성공시
			msg = "success";
		}else { //등록 실패시
			msg = "fail";
		}
		return msg;
	}	

	//추천 삭제
	@PostMapping("/recom_delete.do")
	@ResponseBody
	public String recom_delete(@RequestParam("member_idx") String member_idx, 
			@RequestParam("review_idx") String review_idx) {
		String msg = null;
		
		int result = pDeleteRecom.deleteRecom(review_idx, member_idx); 
		int recomCount = pSelectRecom.selectRecom(review_idx);
		pUpdateRecom.updateRecom(review_idx, recomCount);
		
		if(result == 1){//삭제 성공시
			msg = "success";
		}else { //삭제 실패시
			msg = "fail";
		}
		return msg;
	}
}
