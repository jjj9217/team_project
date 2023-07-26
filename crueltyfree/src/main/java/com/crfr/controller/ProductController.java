package com.crfr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@GetMapping("/product_view.do")
	public String product_view() {		
		return "product/product_view";
	}
	
}
