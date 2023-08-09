package com.crfr.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crfr.common.PageNav;
import com.crfr.service.manager.ManagerService;
import com.crfr.vo.MemberVo;
import com.crfr.vo.OneInqVo;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ProductVo;
import com.crfr.vo.ReviewVo;



@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	ManagerService oneList, proList, memList, proinqList, rvList, mPage, rvCount, proCount, memCount, oneCount, proinqCount,
	proSList, memSList, oneSList, proinqSList, rvSList;
	PageNav pageNav;
	
	@Autowired
	public void setOneList(@Qualifier("oneList") ManagerService oneList) {
		this.oneList = oneList;
	}
	@Autowired
	public void setProList(@Qualifier("proList") ManagerService proList) {
		this.proList = proList;
	}
	@Autowired
	public void setMemList(@Qualifier("memList") ManagerService memList) {
		this.memList = memList;
	}
	@Autowired
	public void setProinqList(@Qualifier("proinqList") ManagerService proinqList) {
		this.proinqList = proinqList;
	}
	@Autowired
	public void setRvList(@Qualifier("rvList") ManagerService rvList) {
		this.rvList = rvList;
	}
	@Autowired
	public void setMPage(@Qualifier("mPage") ManagerService mPage, PageNav pageNav) {
		this.mPage = mPage;
		this.pageNav = pageNav;
	}
	@Autowired
	public void setRvCount(@Qualifier("rvCount") ManagerService rvCount) {
		this.rvCount = rvCount;
	}
	@Autowired
	public void setProCount(@Qualifier("proCount") ManagerService proCount) {
		this.proCount = proCount;
	}
	@Autowired
	public void setMemCount(@Qualifier("memCount") ManagerService memCount) {
		this.memCount = memCount;
	}
	@Autowired
	public void setOneCount(@Qualifier("oneCount") ManagerService oneCount) {
		this.oneCount = oneCount;
	}
	@Autowired
	public void setProinqCount(@Qualifier("proinqCount") ManagerService proinqCount) {
		this.proinqCount = proinqCount;
	}
	@Autowired
	public void setProSList(@Qualifier("proSList") ManagerService proSList) {
		this.proSList = proSList;
	}
	@Autowired
	public void setMemSList(@Qualifier("memSList") ManagerService memSList) {
		this.memSList = memSList;
	}
	@Autowired
	public void setOneSList(@Qualifier("oneSList") ManagerService oneSList) {
		this.oneSList = oneSList;
	}
	@Autowired
	public void setProinqSList(@Qualifier("proinqSList") ManagerService proinqSList) {
		this.proinqSList = proinqSList;
	}
	@Autowired
	public void setRvSList(@Qualifier("rvSList") ManagerService rvSList) {
		this.rvSList = rvSList;
	}
	
	@GetMapping("/manager_1main.do")
	public String manager_1main(Model model) {		
		List<OneInqVo> oneinqList = oneList.getList();
		
		if(oneinqList != null) {
			model.addAttribute("oneinqList", oneinqList);
		}
		return "manager/manager_1main";
	}
	
	@GetMapping("/manager_2product.do")
	public String manager_2product(HttpServletRequest request,Model model,String searchField, String searchWord, String pageNum, String pageBlock) {

		Map<String, Object> map = new HashMap<String, Object>();
		searchField = request.getParameter("searchField");
		searchWord = request.getParameter("searchWord");
		
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}
		
		model.addAttribute("searchField", searchField);
		model.addAttribute("searchWord", searchWord);
		
		List<ProductVo> proSelectList = proSList.proSelectList(searchField,searchWord);//게시물 목록
		model.addAttribute("proSelectList",proSelectList);
		
		List<ProductVo> productList = proList.productList();
		if(productList != null) {
			model.addAttribute("productList", productList);
		}
		
		int totRows = proCount.proselectCount(searchField,searchWord);
		pageNav.setTotalRows(totRows);
		pageNav=mPage.setPageNav(pageNav, pageNum, pageBlock);
		model.addAttribute("pageNav",pageNav);
		
		return "manager/manager_2product";
	}
	@GetMapping("/manager_3member.do")
	public String manager_3member(HttpServletRequest request,Model model,String searchField, String searchWord, String pageNum, String pageBlock) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		searchField = request.getParameter("searchField");
		searchWord = request.getParameter("searchWord");
		
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}
		
		model.addAttribute("searchField", searchField);
		model.addAttribute("searchWord", searchWord);
		
		List<MemberVo> memSelectList = memSList.memSelectList(searchField,searchWord);//게시물 목록
		model.addAttribute("memSelectList",memSelectList);		
		
		List<MemberVo> memberList = memList.memberList();
		
		if(memberList != null) {
			model.addAttribute("memberList", memberList);
		}
		int totRows = memCount.memselectCount(searchField,searchWord);
		pageNav.setTotalRows(totRows);
		pageNav=mPage.setPageNav(pageNav, pageNum, pageBlock);
		model.addAttribute("pageNav",pageNav);
		
		return "manager/manager_3member";
	}
	@GetMapping("/manager_41d1.do")
	public String manager_41d1(HttpServletRequest request,Model model,String searchField, String searchWord, String pageNum, String pageBlock) {		
		
		Map<String, Object> map = new HashMap<String, Object>();
		searchField = request.getParameter("searchField");
		searchWord = request.getParameter("searchWord");
		
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}
		
		model.addAttribute("searchField", searchField);
		model.addAttribute("searchWord", searchWord);
		
		List<OneInqVo> oneSelectList = oneSList.oneSelectList(searchField,searchWord);//게시물 목록
		model.addAttribute("oneSelectList",oneSelectList);			
		
		List<OneInqVo> oneinqList = oneList.getList();
		
		if(oneinqList != null) {
			model.addAttribute("oneinqList", oneinqList);
		}
		int totRows = oneCount.oneselectCount(searchField,searchWord);
		pageNav.setTotalRows(totRows);
		pageNav=mPage.setPageNav(pageNav, pageNum, pageBlock);
		model.addAttribute("pageNav",pageNav);
		return "manager/manager_41d1";
	}
	@GetMapping("/manager_5sign.do")
	public String manager_5sign() {
		return "manager/manager_5sign";
	}
	@GetMapping("/manager_6post.do")
	public String manager_6post() {		
		return "manager/manager_6post";
	}
	@GetMapping("/manager_7goods.do")
	public String manager_7goods(HttpServletRequest request,Model model,String searchField, String searchWord, String pageNum, String pageBlock) {
		
//		1.dao를 통해서 db데이터받아오기
//		2.받아온 데이터를 통해서 List생성하기
//		
//		리스트이름 지정해서 박아넣기(모델)
		
		Map<String, Object> map = new HashMap<String, Object>();
		searchField = request.getParameter("searchField");
		searchWord = request.getParameter("searchWord");
		
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}
		
		model.addAttribute("searchField", searchField);
		model.addAttribute("searchWord", searchWord);
		
		List<ProductInqVo> proinqSelectList = proinqSList.proinqSelectList(searchField,searchWord);//게시물 목록
		model.addAttribute("proinqSelectList",proinqSelectList);			
		
		
		List<ProductInqVo> productinqList = proinqList.productinqList();
		
		if(productinqList != null) {
			model.addAttribute("productinqList", productinqList);
		}
		int totRows = proinqCount.proinqselectCount(searchField,searchWord);
		pageNav.setTotalRows(totRows);
		pageNav=mPage.setPageNav(pageNav, pageNum, pageBlock);
		model.addAttribute("pageNav",pageNav);
		return "manager/manager_7goods";
	}
	
	@GetMapping("/manager_8review.do")
	public String manager_8review(HttpServletRequest request,Model model,String searchField, String searchWord, String pageNum, String pageBlock) 
	{	
		Map<String, Object> map = new HashMap<String, Object>();
		searchField = request.getParameter("searchField");
		searchWord = request.getParameter("searchWord");
		
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}
		
		model.addAttribute("searchField", searchField);
		model.addAttribute("searchWord", searchWord);
		
		List<ReviewVo> rvSelectList = rvSList.rvSelectList(searchField,searchWord);//게시물 목록
		model.addAttribute("rvSelectList",rvSelectList);
		
		List<ReviewVo> reviewList = rvList.reviewList();
		
		if(reviewList != null) {
			model.addAttribute("reviewList", reviewList);
		}
		int totRows = rvCount.selectCount(searchField,searchWord);
		pageNav.setTotalRows(totRows);
		pageNav=mPage.setPageNav(pageNav, pageNum, pageBlock);
		model.addAttribute("pageNav",pageNav);
		return "manager/manager_8review";
	}
	

	
}
