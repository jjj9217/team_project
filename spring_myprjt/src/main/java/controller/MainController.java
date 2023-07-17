package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import service.all_board.AllBoardService;
import service.free_board.FreeBoardService;
import service.oneline_board.OnelineBoardService;
import service.question_board.QuestionBoardService;
import service.review_board.ReviewBoardService;
import vo.AllBoardVo;
import vo.FreeBoardVo;
import vo.OnelineBoardVo;
import vo.QuestionBoardVo;
import vo.ReviewBoardVo;

@Controller
@RequestMapping("/main")
public class MainController {
	
	AllBoardService abSelectCount, abSelectList;
	FreeBoardService fbSelectList;
	QuestionBoardService qbSelectList;
	ReviewBoardService rbSelectList;
	OnelineBoardService obSelectList;
	
	@Autowired
	public void setAbSelectCount(@Qualifier("abSelectCount") AllBoardService abSelectCount) {
		this.abSelectCount = abSelectCount;
	}
	
	@Autowired
	public void setAbSelectList(@Qualifier("abSelectList") AllBoardService abSelectList) {
		this.abSelectList = abSelectList;
	}
	@Autowired
	public void setFbSelectList(@Qualifier("fbSelectList") FreeBoardService fbSelectList) {
		this.fbSelectList = fbSelectList;
	}
	
	@Autowired
	public void setQbSelectList(@Qualifier("qbSelectList") QuestionBoardService qbSelectList) {
		this.qbSelectList = qbSelectList;
	}
	
	@Autowired
	public void setRbSelectList(@Qualifier("rbSelectList") ReviewBoardService rbSelectList) {
		this.rbSelectList = rbSelectList;
	}
	
	@Autowired
	public void setObSelectList(@Qualifier("obSelectList") OnelineBoardService obSelectList) {
		this.obSelectList = obSelectList;
	}
	
	@GetMapping("/home.do")
	public String index(HttpServletRequest request, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		String searchTotal = request.getParameter("searchTotal");

		if(searchTotal != null){
			map.put("searchTotal", searchTotal);
		}
		
		List<FreeBoardVo> FreeboardList = fbSelectList.selectList(map);//자유게시판 게시물 목록
		model.addAttribute("freeBoardList",FreeboardList);
		
		List<QuestionBoardVo> QuestionboardList = qbSelectList.selectList(map);//질문게시판 게시물 목록
		model.addAttribute("questionBoardList",QuestionboardList);
		
		List<ReviewBoardVo> ReviewboardList = rbSelectList.selectList(map);//리뷰게시판 게시물 목록
		model.addAttribute("reviewBoardList",ReviewboardList);
		
		List<OnelineBoardVo> OnelineboardList = obSelectList.selectList(map);//리뷰게시판 게시물 목록
		model.addAttribute("onelineBoardList",OnelineboardList);
		
		return "main/home";
	}
	
	@GetMapping("/search_list.do")
	public String search_list(HttpServletRequest request, Model model) {
		

		//사용자가 입력한 검색 조건을 Map에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		String searchTotal = request.getParameter("searchTotal");
		
		if(searchTotal != null){
		    map.put("searchTotal", searchTotal);
		}
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}

		List<AllBoardVo> searchList = abSelectList.selectList(map);//게시물 목록
		model.addAttribute("searchList",searchList);
		
		int totalRows = abSelectCount.selectCount(map);//게시물 수
		model.addAttribute("totalRows",totalRows);
		
		int rows_per_page = 10;
		int pages_per_block = 5;
		int pageNum = 0;
			if(request.getParameter("pageNum") == null){
				pageNum = 1;
			}else{
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}
		int totalPageNum = (int)Math.ceil((double)totalRows/rows_per_page);
		int pageBlock = 0;
			if(request.getParameter("pageBlock") == null){
				pageBlock = 1;
			}else{
				pageBlock = Integer.parseInt(request.getParameter("pageBlock"));
			}
		int lastPageBlock = (int)Math.ceil((double)totalPageNum/pages_per_block);	
		int startNum = (pageNum - 1)*rows_per_page + 1;
		int endNum = 0;
			if(pageNum != totalPageNum){
				endNum = pageNum*rows_per_page;
			}else{
				endNum = totalRows;
			}
		model.addAttribute("rows_per_page",rows_per_page);
		model.addAttribute("pages_per_block",pages_per_block);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("totalPageNum",totalPageNum);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("lastPageBlock",lastPageBlock);
		model.addAttribute("startNum",startNum);
		model.addAttribute("endNum",endNum);
		model.addAttribute("searchField",searchField);
		model.addAttribute("searchWord",searchWord);
		model.addAttribute("searchTotal",searchTotal);
		
		return "main/search_list";
	}
	
	@GetMapping("/search_list20.do")
	public String search_list20(HttpServletRequest request, Model model) {
		

		//사용자가 입력한 검색 조건을 Map에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		String searchTotal = request.getParameter("searchTotal");
		
		if(searchTotal != null){
		    map.put("searchTotal", searchTotal);
		}
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}

		List<AllBoardVo> searchList = abSelectList.selectList(map);//게시물 목록
		model.addAttribute("searchList",searchList);
		
		int totalRows = abSelectCount.selectCount(map);//게시물 수
		model.addAttribute("totalRows",totalRows);
		
		int rows_per_page = 20;
		int pages_per_block = 5;
		int pageNum = 0;
			if(request.getParameter("pageNum") == null){
				pageNum = 1;
			}else{
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}
		int totalPageNum = (int)Math.ceil((double)totalRows/rows_per_page);
		int pageBlock = 0;
			if(request.getParameter("pageBlock") == null){
				pageBlock = 1;
			}else{
				pageBlock = Integer.parseInt(request.getParameter("pageBlock"));
			}
		int lastPageBlock = (int)Math.ceil((double)totalPageNum/pages_per_block);	
		int startNum = (pageNum - 1)*rows_per_page + 1;
		int endNum = 0;
			if(pageNum != totalPageNum){
				endNum = pageNum*rows_per_page;
			}else{
				endNum = totalRows;
			}
		model.addAttribute("rows_per_page",rows_per_page);
		model.addAttribute("pages_per_block",pages_per_block);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("totalPageNum",totalPageNum);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("lastPageBlock",lastPageBlock);
		model.addAttribute("startNum",startNum);
		model.addAttribute("endNum",endNum);
		model.addAttribute("searchField",searchField);
		model.addAttribute("searchWord",searchWord);
		model.addAttribute("searchTotal",searchTotal);
		
		return "main/search_list20";
	}
	
	@GetMapping("/search_list30.do")
	public String search_list30(HttpServletRequest request, Model model) {
		

		//사용자가 입력한 검색 조건을 Map에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		String searchTotal = request.getParameter("searchTotal");
		
		if(searchTotal != null){
		    map.put("searchTotal", searchTotal);
		}
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}

		List<AllBoardVo> searchList = abSelectList.selectList(map);//게시물 목록
		model.addAttribute("searchList",searchList);
		
		int totalRows = abSelectCount.selectCount(map);//게시물 수
		model.addAttribute("totalRows",totalRows);
		
		int rows_per_page = 30;
		int pages_per_block = 5;
		int pageNum = 0;
			if(request.getParameter("pageNum") == null){
				pageNum = 1;
			}else{
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}
		int totalPageNum = (int)Math.ceil((double)totalRows/rows_per_page);
		int pageBlock = 0;
			if(request.getParameter("pageBlock") == null){
				pageBlock = 1;
			}else{
				pageBlock = Integer.parseInt(request.getParameter("pageBlock"));
			}
		int lastPageBlock = (int)Math.ceil((double)totalPageNum/pages_per_block);	
		int startNum = (pageNum - 1)*rows_per_page + 1;
		int endNum = 0;
			if(pageNum != totalPageNum){
				endNum = pageNum*rows_per_page;
			}else{
				endNum = totalRows;
			}
		model.addAttribute("rows_per_page",rows_per_page);
		model.addAttribute("pages_per_block",pages_per_block);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("totalPageNum",totalPageNum);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("lastPageBlock",lastPageBlock);
		model.addAttribute("startNum",startNum);
		model.addAttribute("endNum",endNum);
		model.addAttribute("searchField",searchField);
		model.addAttribute("searchWord",searchWord);
		model.addAttribute("searchTotal",searchTotal);
		
		return "main/search_list30";
	}
	
}
