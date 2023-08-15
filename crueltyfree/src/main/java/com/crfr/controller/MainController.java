package com.crfr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crfr.service.product.ProductService;
import com.crfr.vo.FileVo;
import com.crfr.vo.ProductVo;


@Controller
@RequestMapping("/main")
public class MainController {
	
ProductService pdList;
	
	@Autowired
	public void setPdList(@Qualifier("pdList") ProductService pdList) {this.pdList = pdList;}
	
	@GetMapping("/home.do")
	public String home(Model model) {
		
		//게시판 목록을 가져오는 요청에 대한 처리를 위한 ProductListService 클래스 이용
		List<ProductVo> productList = pdList.MainselectList();
		//가격대 적용을 위해 ExploreVo vo의 최저가, 최고가 담기
		model.addAttribute("productList", productList);
		System.out.println(productList);
		//게시판 사진목록을 가져오는 요청에 대한 처리를 위한 ProductListService 클래스 이용
		List<FileVo> fileList = pdList.MainselectListimg();
		model.addAttribute("fileList", fileList);
		
		return "main/home";
	}
	
}
