package com.crfr.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.crfr.service.product.ProductService;
import com.crfr.service.productView.ProductViewService;
import com.crfr.vo.BasketListVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.ProductVo;
import com.crfr.vo.RecentViewVo;

import lombok.Setter;


@Controller
public class HomeController {
	
	ProductService pdList;
	
	@Setter(onMethod_={ @Autowired })	
	ProductViewService pSelectView, pSelectThumbnail, pSelectRecentViewList;
	
	@Autowired
	public void setPdList(@Qualifier("pdList") ProductService pdList) {this.pdList = pdList;}
	
	@GetMapping("/")
	public String home(Model model,  HttpServletRequest request) {
				
		//게시판 목록을 가져오는 요청에 대한 처리를 위한 ProductListService 클래스 이용
		List<ProductVo> productList = pdList.MainselectList();
		//가격대 적용을 위해 ExploreVo vo의 최저가, 최고가 담기
		model.addAttribute("productList", productList);
		System.out.println(productList);
		//게시판 사진목록을 가져오는 요청에 대한 처리를 위한 ProductListService 클래스 이용
		List<FileVo> fileList = pdList.MainselectListimg();
		model.addAttribute("fileList", fileList);
		
		HttpSession session = request.getSession();
//		//최근본상품추가
//		String client_num = null;
//		Cookie[] cookies = request.getCookies(); //쿠키를 불러와서
//	    if (cookies != null) {
//	        for (Cookie cookie : cookies) {
//	            if ("guestId".equals(cookie.getName())) { //이름이 "guestId"인 쿠키의 value를
//	            	client_num  = cookie.getValue();	//client_num에 넣음
//	                break;
//	            }//end of if - cookie 이름 조건문
//	        }//end of for
//	    }//end of if - cookie null값 조건문
//	    
//	    
//		//최근본상품 리스트
//	    List<RecentViewVo> RecentViewVoList = pSelectRecentViewList.selectRecentViewList(client_num);
//	    int RecentViewListCount = 0;
//	    
//	    List<BasketListVo> RecentViewList = new ArrayList<>(); // 빈 리스트로 초기화
//	    
//	    for(RecentViewVo recentView : RecentViewVoList) {
//	    	BasketListVo basketListVo = new BasketListVo(); // 객체 생성
//	    	
//	    	int recentPrdIdx = recentView.getProduct_idx();//최근본 상품의 상품번호 
//			ProductVo recentProduct = pSelectView.selectView(recentPrdIdx);//상품번호의 상품Vo
//			FileVo recentFile = pSelectThumbnail.selectThumbnail(recentPrdIdx); //상품번호의 파일Vo중 1번째
//			
//			basketListVo.setProduct_idx(recentPrdIdx);
//		    basketListVo.setOriginFile(recentFile.getOriginFile());
//		    basketListVo.setSaveFile(recentFile.getSaveFile());
//		    basketListVo.setMember_nickname(recentProduct.getMember_nickname());
//		    basketListVo.setProduct_name(recentProduct.getProduct_name());
//		    basketListVo.setProduct_price(recentProduct.getProduct_price());	
//		    
//		    RecentViewList.add(basketListVo); // RecentViewList에 추가
//	    	RecentViewListCount++;
//	    }
//	    if(RecentViewListCount > 3) {
//	    	RecentViewListCount = 3;
//	    }
//	    session.removeAttribute("RecentViewListCount");
//	    session.setAttribute("RecentViewListCount", RecentViewListCount);
//	    session.removeAttribute("RecentViewList");
//	    session.setAttribute("RecentViewList", RecentViewList);
		
		return "main/home";
	}
	
}
