package com.crfr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@GetMapping("/manager_1main.do")
	public String manager_1main() {		
		return "manager/manager_1main";
	}
	@GetMapping("/manager_2product.do")
	public String manager_2product() {
		return "manager/manager_2product";
	}
	@GetMapping("/manager_3member.do")
	public String manager_3member() {
		return "manager/manager_3member";
	}
	@GetMapping("/manager_41d1.do")
	public String manager_41d1() {		
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
	public String manager_7goods() {
		
//		1.dao를 통해서 db데이터받아오기
//		2.받아온 데이터를 통해서 List생성하기
//		
//		리스트이름 지정해서 박아넣기(모델)
		
		return "manager/manager_7goods";
	}
	@GetMapping("/manager_8review.do")
	public String manager_8review() {		
		return "manager/manager_8review";
	}
}
