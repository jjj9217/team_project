package com.crfr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	@GetMapping("/basket.do")
	public String basket() {		
		return "purchase/basket";
	}
	
	@GetMapping("/order.do")
	public String order() {		
		return "purchase/order";
	}
	
	@GetMapping("/order_complete.do")
	public String order_complete() {		
		return "purchase/order_complete";
	}
}
