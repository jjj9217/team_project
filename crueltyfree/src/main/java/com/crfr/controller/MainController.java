package com.crfr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/main")
public class MainController {
	
	@GetMapping("/home.do")
	public String home() {		
		return "main/home";
	}
	
}
