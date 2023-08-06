package com.crfr.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crfr.service.manager.ManagerService;
import com.crfr.vo.MemberVo;
import com.crfr.vo.OneInqVo;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ProductVo;
import com.crfr.vo.ReviewVo;



@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	ManagerService oneList, proList, memList, proinqList, rvList;
	
	
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
	
	@GetMapping("/manager_1main.do")
	public String manager_1main(Model model) {		
		List<OneInqVo> oneinqList = oneList.getList();
		
		if(oneinqList != null) {
			model.addAttribute("oneinqList", oneinqList);
		}
		return "manager/manager_1main";
	}
	
	@GetMapping("/manager_2product.do")
	public String manager_2product(Model model) {
		List<ProductVo> productList = proList.productList();
		
		if(productList != null) {
			model.addAttribute("productList", productList);
		}
		
		return "manager/manager_2product";
	}
	@GetMapping("/manager_3member.do")
	public String manager_3member(Model model) {
		List<MemberVo> memberList = memList.memberList();
		
		if(memberList != null) {
			model.addAttribute("memberList", memberList);
		}
		
		return "manager/manager_3member";
	}
	@GetMapping("/manager_41d1.do")
	public String manager_41d1(Model model) {		
		List<OneInqVo> oneinqList = oneList.getList();
		
		if(oneinqList != null) {
			model.addAttribute("oneinqList", oneinqList);
		}
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
	public String manager_7goods(Model model) {
		
//		1.dao를 통해서 db데이터받아오기
//		2.받아온 데이터를 통해서 List생성하기
//		
//		리스트이름 지정해서 박아넣기(모델)
		List<ProductInqVo> productinqList = proinqList.productinqList();
		
		if(productinqList != null) {
			model.addAttribute("productinqList", productinqList);
		}
		
		return "manager/manager_7goods";
	}
	@GetMapping("/manager_8review.do")
	public String manager_8review(Model model) {		
		List<ReviewVo> reviewList = rvList.reviewList();
		
		if(reviewList != null) {
			model.addAttribute("reviewList", reviewList);
		}
		return "manager/manager_8review";
	}
	

	
}
