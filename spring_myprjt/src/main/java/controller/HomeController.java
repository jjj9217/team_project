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

import service.free_board.FreeBoardService;
import service.oneline_board.OnelineBoardService;
import service.question_board.QuestionBoardService;
import service.review_board.ReviewBoardService;
import vo.FreeBoardVo;
import vo.OnelineBoardVo;
import vo.QuestionBoardVo;
import vo.ReviewBoardVo;

@Controller
public class HomeController {
	
	FreeBoardService fbSelectList;
	QuestionBoardService qbSelectList;
	ReviewBoardService rbSelectList;
	OnelineBoardService obSelectList;
	
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
	
	@GetMapping("/")
	public String home(HttpServletRequest request, Model model) {
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
	

}
