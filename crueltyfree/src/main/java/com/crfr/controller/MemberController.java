package com.crfr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/find_id.do")
	public String find_id() {		
		return "member/find_id";
	}
	@GetMapping("/find_pw.do")
	public String find_pw() {		
		return "member/find_pw";
	}
	@GetMapping("/join.do")
	public String join() {		
		return "member/join";
	}
	@GetMapping("/login.do")
	public String login() {		
		return "member/login";
	}
	@GetMapping("/terms.do")
	public String terms() {		
		return "member/terms";
	}
}
