package com.crfr.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.crfr.service.oneInq.OneInqService;
import com.crfr.vo.NoticeVo;
import com.crfr.vo.PageNav;

import lombok.Setter;

@Controller
@RequestMapping("/one_inq")
public class OneInqController {
	//서비스 클래스로 사용할 클래스들을 멤버변수로 정의하고 의존 자동 주입받도록 함
	@Setter(onMethod_={ @Autowired })
	OneInqService nInsertNotice, 
	cNoticeCount;
	
	@Setter(onMethod_={ @Autowired })
	PageNav pageNav;
	
	@GetMapping("/notice.do")
	public String notice () {	
		return "one_inq/notice";
	}
	
	@GetMapping("/notice_write.do")
	public String notice_write() {		
		return "one_inq/notice_write";
	}
	
	@PostMapping("/notice_process.do")
	public String notice_process(@RequestParam("attachedFile") MultipartFile attachedFile,
			String notice_title, String notice_content, HttpServletRequest request) {
		
		String viewPage = "one_inq/notice_write"; //글등록 실패시 보여지는 페이지
		
		//작성 내용 저장
		System.out.println("여기까진 성공");
		System.out.println("알림 내용:" + notice_content);
		int result = nInsertNotice.insertNotice(attachedFile, notice_title, notice_content, request);
		System.out.println("여기서 실패");
		
		if(result == 1) { // 글 등록 성공시 보여지는 페이지
			viewPage = "redirect:/seller/check_pro.do";
		}
		
		return viewPage;
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
