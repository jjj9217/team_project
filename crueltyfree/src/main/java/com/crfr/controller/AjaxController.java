package com.crfr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.crfr.service.email.EmailService;

@RestController
public class AjaxController {
	
	private EmailService eSend;
	
	@Autowired
	public void setESend(@Qualifier("eSend") EmailService eSend) {
		this.eSend=eSend;
	}

	//이메일 인증
	@GetMapping("/member/emailCheck.do")
	public String emailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일: "+email);
		return eSend.joinEmail(email);
	}
}