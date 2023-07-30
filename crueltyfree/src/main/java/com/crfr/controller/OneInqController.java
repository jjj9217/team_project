package com.crfr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/one_inq")
public class OneInqController {
	
	@GetMapping("/notice.do")
	public String notice() {		
		return "one_inq/notice";
	}
	@GetMapping("/one_inq_list.do")
	public String one_inq_list() {		
		return "one_inq/one_inq_list";
	}
	@GetMapping("/one_inq_write.do")
	public String one_inq_write() {		
		return "one_inq/one_inq_write";
	}
}
