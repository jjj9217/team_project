package com.crfr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crfr.service.product.ProductService;
import com.crfr.vo.ExploreVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ProductVo;

@Controller
@RequestMapping("/product")
public class ProductListController {
	
	ProductService pdCount, pdList, pdView, pdPage;
	PageNav pageNav;
	
	@Autowired
	public void setPdCount(@Qualifier("pdCount") ProductService pdCount) {this.pdCount = pdCount;}
	
	@Autowired
	public void setPdList(@Qualifier("pdList") ProductService pdList) {this.pdList = pdList;}

	@Autowired
	public void setPdView(@Qualifier("pdView") ProductService pdView) {this.pdView = pdView;}	
	
	@Autowired
	public void setPdPage(@Qualifier("pdPage") ProductService pdPage, PageNav pageNav) {
		this.pdPage = pdPage;
		this.pageNav = pageNav;
	}
	
	//요청을 처리하는 메소드들 정의
	
	//1.카테고리 검색어로 진입하는 list페이지
	@GetMapping("/product_list_enter_searchword.do")
	public String list(@ModelAttribute ExploreVo vo, 
					   String pageNum, String pageBlock, Model model) {
		System.out.println("ProductController's ExploreVo price_min:"+ vo.getProduct_price_min());		

		//@RequestParam(value="category_code", required=false) String category_code,
		//vo.setCategory_code(category_code);
		System.out.println("받은 카테고리코드:"+ vo.getCategory_code());
		System.out.println("받은 sort_salecount: " + vo.getSort_salecount());
		System.out.println("받은 최저가:"+vo.getProduct_price_min());
		System.out.println("받은 최고가:"+vo.getProduct_price_max());
		//if 카테고리(대)

		

		/*
		 * vo.setCategory_code(category_code); //else 카테고리(소)
		 * vo.setCategory_code_small(category_code);
		 */
		
		
		
		//게시판 목록을 가져오는 요청에 대한 처리를 위한 ProductListService 클래스 이용
		List<ProductVo> productList = pdList.selectList(vo);
		//가격대 적용을 위해 ExploreVo vo의 최저가, 최고가 담기
		model.addAttribute("productList", productList);
		
		//게시판 사진목록을 가져오는 요청에 대한 처리를 위한 ProductListService 클래스 이용
		List<FileVo> fileList = pdList.selectListimg(vo);
		model.addAttribute("fileList", fileList);
		
		//총 레코드 수를 가져오기 위해 ProductCountService클래스 이용
		int searchTotal = pdCount.selectCount(vo);
		System.out.println("ProductController's RecordCount: "+searchTotal);
		//총 레코드 수 대입
		pageNav.setTotalRows(searchTotal);		
		//페이지네비게이션을 위해 ProductPageService클래스를 이용		
		pageNav = pdPage.setPageNav(pageNav, pageNum, pageBlock, vo);

		//html에서 사용하기 위해 세팅
		model.addAttribute("pageNav", pageNav);
		System.out.println("ProductController's ExploreVo.view count:"+ vo.getSort_view()+"\n");
		
		
		return "product/product_list_enter_searchword";
		}

		
		
	
	
	
	
	
	
		@GetMapping("/product_list_enter_searchword2.do")
		@ResponseBody
		public String list2(@ModelAttribute ExploreVo vo, 
				   String pageNum, String pageBlock, Model model) {		
			
			System.out.println("2.받은 카테고리코드"+ vo.getCategory_code());
			//게시판 목록을 가져오는 요청에 대한 처리를 위한 ProductListService 클래스 이용
			List<ProductVo> productList = pdList.selectList(vo);
			//가격대 적용을 위해 ExploreVo vo의 최저가, 최고가 담기
			model.addAttribute("productList", productList);
			
			//게시판 사진목록을 가져오는 요청에 대한 처리를 위한 ProductListService 클래스 이용
			List<FileVo> fileList = pdList.selectListimg(vo);
			model.addAttribute("fileList", fileList);
			
			//총 레코드 수를 가져오기 위해 ProductCountService클래스 이용
			int searchTotal = pdCount.selectCount(vo);
			System.out.println("ProductController's RecordCount: "+searchTotal);
			//총 레코드 수 대입
			pageNav.setTotalRows(searchTotal);		
			//페이지네비게이션을 위해 ProductPageService클래스를 이용		
			pageNav = pdPage.setPageNav(pageNav, pageNum, pageBlock, vo);

			//html에서 사용하기 위해 세팅
			model.addAttribute("pageNav", pageNav);
			System.out.println("ProductController's ExploreVo.view count:"+ vo.getSort_view()+"\n");
			
			String result;
				if(vo.getCategory_code() != null) {
					result = "success";
				}else {
					result = "fail";
				}
			System.out.println("result값: "+result);
			return result;
		}
		
		/*
		 * //2.상품목록 정렬순서에 관한 list페이지
		 * 
		 * @GetMapping("/product_list_enter_searchword_Sort_saleCount.do") public String
		 * list2(ExploreVo vo, String pageNum, String pageBlock, Model model) {
		 * 
		 * //게시판 목록을 가져오는 요청에 대한 처리를 위한 ProductListService 클래스 이용 List<ProductVo>
		 * productList = pdList.selectList_saleCount(vo);
		 * model.addAttribute("productList", productList);
		 * 
		 * //게시판 사진목록을 가져오는 요청에 대한 처리를 위한 ProductListService 클래스 이용 List<FileVo>
		 * fileList = pdList.selectListimg_saleCount(vo); model.addAttribute("fileList",
		 * fileList);
		 * 
		 * //총 레코드 수를 가져오기 위해 ProductCountService클래스 이용 int searchTotal =
		 * pdCount.selectCount(vo); System.out.println(searchTotal); //총 레코드 수 대입
		 * pageNav.setTotalRows(searchTotal); //페이지네비게이션을 위해 ProductPageService클래스를 이용
		 * pageNav = pdPage.setPageNav(pageNav, pageNum, pageBlock, vo);
		 * 
		 * //html에서 사용하기 위해 세팅 model.addAttribute("pageNav", pageNav);
		 * 
		 * return "product/product_list_enter_searchword"; }
		 * 
		 * 
		 * 
		 * @GetMapping("/product_list_enter_searchword_category.do") public String
		 * list3(@RequestParam("no")String category_code, ExploreVo vo, String pageNum,
		 * String pageBlock, Model model) {
		 * 
		 * //게시판 목록을 가져오는 요청에 대한 처리를 위한 ProductListService 클래스 이용 List<ProductVo>
		 * productList = pdList.selectList_saleCount(vo);
		 * model.addAttribute("productList", productList);
		 * 
		 * //게시판 사진목록을 가져오는 요청에 대한 처리를 위한 ProductListService 클래스 이용 List<FileVo>
		 * fileList = pdList.selectListimg_saleCount(vo); model.addAttribute("fileList",
		 * fileList);
		 * 
		 * //총 레코드 수를 가져오기 위해 ProductCountService클래스 이용 int searchTotal =
		 * pdCount.selectCount(vo); System.out.println(searchTotal); //총 레코드 수 대입
		 * pageNav.setTotalRows(searchTotal); //페이지네비게이션을 위해 ProductPageService클래스를 이용
		 * pageNav = pdPage.setPageNav(pageNav, pageNum, pageBlock, vo);
		 * 
		 * //html에서 사용하기 위해 세팅 model.addAttribute("pageNav", pageNav);
		 * 
		 * category_code=vo.getCategory_code();
		 * System.out.println("cate: "+category_code); return
		 * "product/product_list_enter_searchword"; }
		 */
	
	
	
	
	
	
//	@GetMapping("/product_view.do")
//	public String product_view() {		
//		return "product/product_view";
//	}
//				
//	@GetMapping("/product_list_enter_category.do")
//	public String product_list_enter_category() {		
//		return "product/product_list_enter_category";
//	}
		
}
