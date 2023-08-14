package com.crfr.controller;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crfr.common.PageNav1;
import com.crfr.service.manager.ManagerService;
import com.crfr.vo.MemberVo;
import com.crfr.vo.OneInqVo;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ProductVo;
import com.crfr.vo.ReviewVo;



@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	ManagerService oneList, proList, memList, selList, proinqList, rvList, mPage, rvCount, proCount, memCount, oneCount, selCount, proinqCount,
	proSList, memSList, oneSList, selSList, proinqSList, rvSList, proDelete, memDelete, proinqDelete, oneDelete, selDelete, rvDelete, aUpdateProduct, pfineProductPost1
	,memUpdate, oneUpdate, proinqUpdate, rvUpdate, procheckDelete, memcheckDelete, onecheckDelete, selcheckDelete, proinqcheckDelete, rvcheckDelete;
	PageNav1 pageNav;
	
	@Autowired
	public void setOneList(@Qualifier("oneList") ManagerService oneList) {
		this.oneList = oneList;
	}
	@Autowired
	public void setProList(@Qualifier("proList") ManagerService proList) {
		this.proList = proList;
	}
	@Autowired
	public void setMemList(@Qualifier("memList") ManagerService memList) {
		this.memList = memList;
	}
	@Autowired
	public void setSelList(@Qualifier("selList") ManagerService selList) {
		this.selList = selList;
	}
	@Autowired
	public void setProinqList(@Qualifier("proinqList") ManagerService proinqList) {
		this.proinqList = proinqList;
	}
	@Autowired
	public void setRvList(@Qualifier("rvList") ManagerService rvList) {
		this.rvList = rvList;
	}
	@Autowired
	public void setMPage(@Qualifier("mPage") ManagerService mPage, PageNav1 pageNav) {
		this.mPage = mPage;
		this.pageNav = pageNav;
	}
	@Autowired
	public void setRvCount(@Qualifier("rvCount") ManagerService rvCount) {
		this.rvCount = rvCount;
	}
	@Autowired
	public void setProCount(@Qualifier("proCount") ManagerService proCount) {
		this.proCount = proCount;
	}
	@Autowired
	public void setMemCount(@Qualifier("memCount") ManagerService memCount) {
		this.memCount = memCount;
	}
	@Autowired
	public void setOneCount(@Qualifier("oneCount") ManagerService oneCount) {
		this.oneCount = oneCount;
	}
	@Autowired
	public void setSelCount(@Qualifier("selCount") ManagerService selCount) {
		this.selCount = selCount;
	}
	@Autowired
	public void setProinqCount(@Qualifier("proinqCount") ManagerService proinqCount) {
		this.proinqCount = proinqCount;
	}
	@Autowired
	public void setProSList(@Qualifier("proSList") ManagerService proSList) {
		this.proSList = proSList;
	}
	@Autowired
	public void setMemSList(@Qualifier("memSList") ManagerService memSList) {
		this.memSList = memSList;
	}
	@Autowired
	public void setOneSList(@Qualifier("oneSList") ManagerService oneSList) {
		this.oneSList = oneSList;
	}
	@Autowired
	public void setSelSList(@Qualifier("selSList") ManagerService selSList) {
		this.selSList = selSList;
	}
	@Autowired
	public void setProinqSList(@Qualifier("proinqSList") ManagerService proinqSList) {
		this.proinqSList = proinqSList;
	}
	@Autowired
	public void setRvSList(@Qualifier("rvSList") ManagerService rvSList) {
		this.rvSList = rvSList;
	}
	@Autowired
	public void setProDelete(@Qualifier("proDelete") ManagerService proDelete) {
		this.proDelete = proDelete;
	}
	@Autowired
	public void setMemDelete(@Qualifier("memDelete") ManagerService memDelete) {
		this.memDelete = memDelete;
	}
	@Autowired
	public void setOneDelete(@Qualifier("oneDelete") ManagerService oneDelete) {
		this.oneDelete = oneDelete;
	}
	@Autowired
	public void setSelDelete(@Qualifier("selDelete") ManagerService selDelete) {
		this.selDelete = selDelete;
	}
	@Autowired
	public void setProinqDelete(@Qualifier("proinqDelete") ManagerService proinqDelete) {
		this.proinqDelete = proinqDelete;
	}
	@Autowired
	public void setRvDelete(@Qualifier("rvDelete") ManagerService rvDelete) {
		this.rvDelete = rvDelete;
	}
	@Autowired
	public void setPUpdateProduct(@Qualifier("aUpdateProduct") ManagerService pUpdateProduct) {
		this.aUpdateProduct = pUpdateProduct;
	}
	@Autowired
	public void setpfineProductPost(@Qualifier("pfineProductPost1") ManagerService pfineProductPost) {
		this.pfineProductPost1 = pfineProductPost;
	}
	@Autowired
	public void setMemUpdate(@Qualifier("memUpdate") ManagerService memUpdate) {
		this.memUpdate = memUpdate;
	}
	@Autowired
	public void setOneUpdate(@Qualifier("oneUpdate") ManagerService oneUpdate) {
		this.oneUpdate = oneUpdate;
	}
	@Autowired
	public void setProinqUpdate(@Qualifier("proinqUpdate") ManagerService proinqUpdate) {
		this.proinqUpdate = proinqUpdate;
	}
	@Autowired
	public void setRvUpdate(@Qualifier("rvUpdate") ManagerService rvUpdate) {
		this.rvUpdate = rvUpdate;
	}
	@Autowired
	public void setProcheckDelete(@Qualifier("procheckDelete") ManagerService procheckDelete) {
		this.procheckDelete = procheckDelete;
	}
	@Autowired
	public void setMemcheckDelete(@Qualifier("memcheckDelete") ManagerService memcheckDelete) {
		this.memcheckDelete = memcheckDelete;
	}
	@Autowired
	public void setOnecheckDelete(@Qualifier("onecheckDelete") ManagerService onecheckDelete) {
		this.onecheckDelete = onecheckDelete;
	}
	@Autowired
	public void setSelcheckDelete(@Qualifier("selcheckDelete") ManagerService selcheckDelete) {
		this.selcheckDelete = selcheckDelete;
	}
	@Autowired
	public void setProinqcheckDelete(@Qualifier("proinqcheckDelete") ManagerService proinqcheckDelete) {
		this.proinqcheckDelete = proinqcheckDelete;
	}
	@Autowired
	public void setRvcheckDelete(@Qualifier("rvcheckDelete") ManagerService rvcheckDelete) {
		this.rvcheckDelete = rvcheckDelete;
	}

	
	@GetMapping("/manager_1main.do")
	public String manager_1main(Model model) {		
		List<OneInqVo> oneinqList = oneList.getList();
		
		if(oneinqList != null) {
			model.addAttribute("oneinqList", oneinqList);
		}
		
		List<OneInqVo> sellerList = selList.sellersignList();
		
		if(sellerList != null) {
			model.addAttribute("sellerList", sellerList);
		}
		
		List<ProductInqVo> productinqList = proinqList.productinqList();
		
		if(productinqList != null) {
			model.addAttribute("productinqList", productinqList);
		}
		return "manager/manager_1main";
	}
	
	@GetMapping("/manager_2product.do")
	public String manager_2product(HttpServletRequest request, Model model, String searchField, String searchWord, String pageNum, String pageBlock) {
						
		Map<String, Object> map = new HashMap<String, Object>();
		searchField = request.getParameter("searchField");
		searchWord = request.getParameter("searchWord");
		
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}
		
		model.addAttribute("searchField", searchField);
		model.addAttribute("searchWord", searchWord);
		
		List<ProductVo> proSelectList = proSList.proSelectList(searchField,searchWord);//게시물 목록
		model.addAttribute("proSelectList",proSelectList);
		
		List<ProductVo> productList = proList.productList();
		if(productList != null) {
			model.addAttribute("productList", productList);
		}
		
		int totRows = proCount.proselectCount(searchField,searchWord);
		pageNav.setTotalRows(totRows);
		pageNav=mPage.setPageNav(pageNav, pageNum, pageBlock);
		model.addAttribute("pageNav",pageNav);

		
		return "manager/manager_2product";
	}
	@GetMapping("/manager_2product_edit.do")
	public String manager_2product_edit(@RequestParam("no")String product_idx, Model model) {
		//게시물 가져오기 - 
		ProductVo vo = pfineProductPost1.findProductPost(product_idx);
		model.addAttribute("ProductVo", vo);
		
		return "manager/manager_2product_edit";
	}
	// 글 수정 요청 처리
	@PostMapping("/edit_pro_process.do")
	public String edit_process(
			String product_name1, String product_price1,
			String product_capa1, String delivery_company1, 
			String product_idx1,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();

		String viewPage = "manager/manager_2product_edit"; //글수정 실패시 보여지는 페이지
		//첨부파일과 함께 글내용 수정을 BoardFileUpdateService클래스 이용
		int result1 = aUpdateProduct.productUpdate(product_name1, 
				product_price1, product_capa1, delivery_company1, product_idx1);

		if(result1 == 1) { //글 수정 성공시 보여지는 페이지

			viewPage = "redirect:/manager/manager_2product.do";	
		}
			
		return viewPage;
	}
	@PostMapping("/edit_mem_process.do")
	public String edit4_process(
			String member_id, String member_name,
			String member_gender, String member_grade, 
			String member_idx,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		String viewPage = "manager/manager_3member"; //글수정 실패시 보여지는 페이지
		//첨부파일과 함께 글내용 수정을 BoardFileUpdateService클래스 이용
		int result1 = memUpdate.memberUpdate(member_id, 
				member_name, member_gender, member_grade, member_idx);

		if(result1 == 1) { //글 수정 성공시 보여지는 페이지

			viewPage = "redirect:/manager/manager_3member.do";	
		}
			
		return viewPage;
	}
	@PostMapping("/edit_one_process.do")
	public String edit2_process(
			String one_inq_answer, String one_inq_idx,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		String viewPage = "manager/manager_41d1"; //글수정 실패시 보여지는 페이지
		//첨부파일과 함께 글내용 수정을 BoardFileUpdateService클래스 이용
		int result1 = oneUpdate.oneinqUpdate(one_inq_answer, one_inq_idx);

		if(result1 == 1) { //글 수정 성공시 보여지는 페이지

			viewPage = "redirect:/manager/manager_41d1.do";	
		}
			
		return viewPage;
	}
	@PostMapping("/edit_sel_process.do")
	public String edit5_process(
			String one_inq_answer, String one_inq_idx,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		String viewPage = "manager/manager_5sign"; //글수정 실패시 보여지는 페이지
		//첨부파일과 함께 글내용 수정을 BoardFileUpdateService클래스 이용
		int result1 = oneUpdate.oneinqUpdate(one_inq_answer, one_inq_idx);

		if(result1 == 1) { //글 수정 성공시 보여지는 페이지

			viewPage = "redirect:/manager/manager_5sign.do";	
		}
			
		return viewPage;
	}
	@PostMapping("/edit_proinq_process.do")
	public String edit_process(String product_inq_answer, String product_inq_idx,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		String viewPage = "manager/manager_7goods"; //글수정 실패시 보여지는 페이지
		//첨부파일과 함께 글내용 수정을 BoardFileUpdateService클래스 이용
		int result1 = proinqUpdate.productinqUpdate(product_inq_answer, product_inq_idx);

		if(result1 == 1) { //글 수정 성공시 보여지는 페이지

			viewPage = "redirect:/manager/manager_7goods.do";	
		}
			
		return viewPage;
	}
	@PostMapping("/edit_review_process.do")
	public String edit3_process(String review_content, String review_idx, 
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		String viewPage = "manager/manager_8review"; //글수정 실패시 보여지는 페이지
		//첨부파일과 함께 글내용 수정을 BoardFileUpdateService클래스 이용
		int result1 = rvUpdate.reviewUpdate(review_content, review_idx);

		if(result1 == 1) { //글 수정 성공시 보여지는 페이지

			viewPage = "redirect:/manager/manager_8review.do";	
		}
			
		return viewPage;
	}
	
	
	@GetMapping("/manager_3member.do")
	public String manager_3member(HttpServletRequest request,Model model,String searchField, String searchWord, String pageNum, String pageBlock) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		searchField = request.getParameter("searchField");
		searchWord = request.getParameter("searchWord");
		
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}
		
		model.addAttribute("searchField", searchField);
		model.addAttribute("searchWord", searchWord);
		
		List<MemberVo> memSelectList = memSList.memSelectList(searchField,searchWord);//게시물 목록
		model.addAttribute("memSelectList",memSelectList);		
		
		List<MemberVo> memberList = memList.memberList();
		
		if(memberList != null) {
			model.addAttribute("memberList", memberList);
		}
		int totRows = memCount.memselectCount(searchField,searchWord);
		pageNav.setTotalRows(totRows);
		pageNav=mPage.setPageNav(pageNav, pageNum, pageBlock);
		model.addAttribute("pageNav",pageNav);
		
		return "manager/manager_3member";
	}
	@GetMapping("/manager_41d1.do")
	public String manager_41d1(HttpServletRequest request,Model model,String searchField, String searchWord, String pageNum, String pageBlock) {		
		
		Map<String, Object> map = new HashMap<String, Object>();
		searchField = request.getParameter("searchField");
		searchWord = request.getParameter("searchWord");
		
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}
		
		model.addAttribute("searchField", searchField);
		model.addAttribute("searchWord", searchWord);
		
		List<OneInqVo> oneSelectList = oneSList.oneSelectList(searchField,searchWord);//게시물 목록
		for(OneInqVo vo : oneSelectList) {
			if(vo.getOne_inq_regDate() != null) {
				Date orderDate = vo.getOne_inq_regDate();
				Date adjustedDate = new Date(orderDate.getTime() - (9 * 60 * 60 * 1000)); // 9시간을 밀리초로 변환하여 뺌
				vo.setOne_inq_regDate(adjustedDate);				
			}
		}
		model.addAttribute("oneSelectList",oneSelectList);			
		
		List<OneInqVo> oneinqList = oneList.getList();
		
		if(oneinqList != null) {
			model.addAttribute("oneinqList", oneinqList);
		}
		int totRows = oneCount.oneselectCount(searchField,searchWord);
		pageNav.setTotalRows(totRows);
		pageNav=mPage.setPageNav(pageNav, pageNum, pageBlock);
		model.addAttribute("pageNav",pageNav);
	
		
		return "manager/manager_41d1";
	}
	@GetMapping("/manager_5sign.do")
	public String manager_5sign(HttpServletRequest request,Model model,String searchField, String searchWord, String pageNum, String pageBlock) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		searchField = request.getParameter("searchField");
		searchWord = request.getParameter("searchWord");
		
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}
		
		model.addAttribute("searchField", searchField);
		model.addAttribute("searchWord", searchWord);
		
		List<OneInqVo> selSelectList = selSList.selSelectList(searchField,searchWord);//게시물 목록
		for(OneInqVo vo : selSelectList) {
			if(vo.getOne_inq_regDate() != null) {
				Date orderDate = vo.getOne_inq_regDate();
				Date adjustedDate = new Date(orderDate.getTime() - (9 * 60 * 60 * 1000)); // 9시간을 밀리초로 변환하여 뺌
				vo.setOne_inq_regDate(adjustedDate);				
			}
		}
		model.addAttribute("selSelectList",selSelectList);
		
		List<OneInqVo> sellerList = selList.sellersignList();
		
		if(sellerList != null) {
			model.addAttribute("sellerList", sellerList);
		}
		int totRows = selCount.selselectCount(searchField,searchWord);
		pageNav.setTotalRows(totRows);
		pageNav=mPage.setPageNav(pageNav, pageNum, pageBlock);
		model.addAttribute("pageNav",pageNav);
		
		return "manager/manager_5sign";
	}
	@GetMapping("/manager_6post.do")
	public String manager_6post() {		
		return "manager/manager_6post";
	}
	@GetMapping("/manager_7goods.do")
	public String manager_7goods(HttpServletRequest request,Model model,String searchField, String searchWord, String pageNum, String pageBlock) {
		
//		1.dao를 통해서 db데이터받아오기
//		2.받아온 데이터를 통해서 List생성하기
//		
//		리스트이름 지정해서 박아넣기(모델)
		
		Map<String, Object> map = new HashMap<String, Object>();
		searchField = request.getParameter("searchField");
		searchWord = request.getParameter("searchWord");
		
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}
		
		model.addAttribute("searchField", searchField);
		model.addAttribute("searchWord", searchWord);
		
		List<ProductInqVo> proinqSelectList = proinqSList.proinqSelectList(searchField,searchWord);//게시물 목록
		for(ProductInqVo vo : proinqSelectList) {
			if(vo.getProduct_inq_regDate() != null) {
				Date orderDate = vo.getProduct_inq_regDate();
				Date adjustedDate = new Date(orderDate.getTime() - (9 * 60 * 60 * 1000)); // 9시간을 밀리초로 변환하여 뺌
				vo.setProduct_inq_regDate(adjustedDate);			
			}
		}		
		model.addAttribute("proinqSelectList",proinqSelectList);			
		
		
		List<ProductInqVo> productinqList = proinqList.productinqList();
		
		if(productinqList != null) {
			model.addAttribute("productinqList", productinqList);
		}
		int totRows = proinqCount.proinqselectCount(searchField,searchWord);
		pageNav.setTotalRows(totRows);
		pageNav=mPage.setPageNav(pageNav, pageNum, pageBlock);
		model.addAttribute("pageNav",pageNav);
		return "manager/manager_7goods";
	}
	
	@GetMapping("/manager_8review.do")
	public String manager_8review(HttpServletRequest request,Model model,String searchField, String searchWord, String pageNum, String pageBlock) 
	{	
		Map<String, Object> map = new HashMap<String, Object>();
		searchField = request.getParameter("searchField");
		searchWord = request.getParameter("searchWord");
		
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}
		
		model.addAttribute("searchField", searchField);
		model.addAttribute("searchWord", searchWord);
		
		List<ReviewVo> rvSelectList = rvSList.rvSelectList(searchField,searchWord);//게시물 목록
		for(ReviewVo vo : rvSelectList) {
			if(vo.getReview_regDate() != null) {
				Date orderDate = vo.getReview_regDate();
				Date adjustedDate = new Date(orderDate.getTime() - (9 * 60 * 60 * 1000)); // 9시간을 밀리초로 변환하여 뺌
				vo.setReview_regDate(adjustedDate);				
			}
		}
		model.addAttribute("rvSelectList",rvSelectList);
		
		List<ReviewVo> reviewList = rvList.reviewList();
		
		if(reviewList != null) {
			model.addAttribute("reviewList", reviewList);
		}
		int totRows = rvCount.selectCount(searchField,searchWord);
		pageNav.setTotalRows(totRows);
		pageNav=mPage.setPageNav(pageNav, pageNum, pageBlock);
		model.addAttribute("pageNav",pageNav);
		return "manager/manager_8review";
	}
	
	@PostMapping("/delete_process.do")
	public String delete(String product_idx) {
		
		String viewPage = "manager/manager_2product.do";//삭제 실패시 뷰페이지
		int result = 0;
		result = proDelete.delete(product_idx);
		if(result == 1){//회원탈퇴 성공시
			viewPage = "redirect:/manager/manager_2product.do";//삭제 성공시 메인페이지로
		}
		
		return viewPage;
	}
	@PostMapping("/memdelete_process.do")
	public String memdelete(String member_idx) {
		
		String viewPage = "manager/manager_3member.do";//삭제 실패시 뷰페이지
		int result = 0;
		result = memDelete.memdelete(member_idx);
		if(result == 1){//회원탈퇴 성공시
			viewPage = "redirect:/manager/manager_3member.do";//삭제 성공시 메인페이지로
		}
		
		return viewPage;
	}
	@PostMapping("/onedelete_process.do")
	public String onedelete(String one_inq_idx) {
		
		String viewPage = "manager/manager_41d1.do";//삭제 실패시 뷰페이지
		int result = 0;
		result = oneDelete.onedelete(one_inq_idx);
		if(result == 1){//회원탈퇴 성공시
			viewPage = "redirect:/manager/manager_41d1.do";//삭제 성공시 메인페이지로
		}
		
		return viewPage;
	}
	@PostMapping("/seldelete_process.do")
	public String seldelete(String one_inq_idx) {
		
		String viewPage = "manager/manager_5sign.do";//삭제 실패시 뷰페이지
		int result = 0;
		result = selDelete.seldelete(one_inq_idx);
		if(result == 1){//회원탈퇴 성공시
			viewPage = "redirect:/manager/manager_5sign.do";//삭제 성공시 메인페이지로
		}
		
		return viewPage;
	}
	@PostMapping("/proinqdelete_process.do")
	public String proinqdelete(String product_inq_idx) {
		
		String viewPage = "manager/manager_7goods.do";//삭제 실패시 뷰페이지
		int result = 0;
		result = proinqDelete.proinqdelete(product_inq_idx);
		if(result == 1){//회원탈퇴 성공시
			viewPage = "redirect:/manager/manager_7goods.do";//삭제 성공시 메인페이지로
		}
		
		return viewPage;
	}
	@PostMapping("/reviewdelete_process.do")
	public String reviewdelete(String review_idx) {
		
		String viewPage = "manager/manager_8review.do";//삭제 실패시 뷰페이지
		int result = 0;
		result = rvDelete.reviewdelete(review_idx);
		if(result == 1){//회원탈퇴 성공시
			viewPage = "redirect:/manager/manager_8review.do";//삭제 성공시 메인페이지로
		}
		
		return viewPage;
	}
	
	@PostMapping("/delete.do")
	@ResponseBody
	public String ajaxTest(@RequestParam("valueArr[]") String[] valueArr, 
			HttpServletRequest request) {
		
		for(String check : valueArr) {
			System.out.println(check);
		}
		
		String result = "1";
		
		return result;
	}
	@PostMapping("/product_delete_multiple.do")
	@ResponseBody
	public String product_delete_multiple(@RequestParam("product_idxs[]") String[] product_idxs) {
		String result = null;			
	    int delete_result = 0;
	    
	    for (String product_idx : product_idxs) {
	        delete_result = procheckDelete.productDeleteOne(product_idx);
	    }
		if(delete_result != 0) {
			result="success";
		}else {
			result="fail";
		}
		return result;
	}
	@PostMapping("/member_delete_multiple.do")
	@ResponseBody
	public String member_delete_multiple(@RequestParam("member_idxs[]") String[] member_idxs) {
		String result = null;			
	    int delete_result = 0;
	    
	    for (String member_idx : member_idxs) {
	        delete_result = memcheckDelete.memberDeleteOne(member_idx);
	    }
		if(delete_result != 0) {
			result="success";
		}else {
			result="fail";
		}
		return result;
	}
	@PostMapping("/one_inq_delete_multiple.do")
	@ResponseBody
	public String one_inq_delete_multiple(@RequestParam("one_inq_idxs[]") String[] one_inq_idxs) {
		String result = null;			
	    int delete_result = 0;
	    
	    for (String one_inq_idx : one_inq_idxs) {
	        delete_result = onecheckDelete.oneinqDeleteOne(one_inq_idx);
	    }
		if(delete_result != 0) {
			result="success";
		}else {
			result="fail";
		}
		return result;
	}
	@PostMapping("/sel_one_inq_delete_multiple.do")
	@ResponseBody
	public String sel_one_inq_delete_multiple(@RequestParam("one_inq_idxs[]") String[] one_inq_idxs) {
		String result = null;			
	    int delete_result = 0;
	    
	    for (String one_inq_idx : one_inq_idxs) {
	        delete_result = selcheckDelete.seloneinqDeleteOne(one_inq_idx);
	    }
		if(delete_result != 0) {
			result="success";
		}else {
			result="fail";
		}
		return result;
	}
	@PostMapping("/product_inq_delete_multiple.do")
	@ResponseBody
	public String product_inq_delete_multiple(@RequestParam("product_inq_idxs[]") String[] product_inq_idxs) {
		String result = null;			
	    int delete_result = 0;
	    
	    for (String product_inq_idx : product_inq_idxs) {
	        delete_result = proinqcheckDelete.productinqDeleteOne(product_inq_idx);
	    }
		if(delete_result != 0) {
			result="success";
		}else {
			result="fail";
		}
		return result;
	}
	@PostMapping("/review_delete_multiple.do")
	@ResponseBody
	public String review_delete_multiple(@RequestParam("review_idxs[]") String[] review_idxs) {
		String result = null;			
	    int delete_result = 0;
	    
	    for (String review_idx : review_idxs) {
	        delete_result = rvcheckDelete.reviewDeleteOne(review_idx);
	    }
		if(delete_result != 0) {
			result="success";
		}else {
			result="fail";
		}
		return result;
	}
}
