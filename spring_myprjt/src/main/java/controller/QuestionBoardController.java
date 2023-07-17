package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;
import service.all_board.AllBoardService;
import service.question_board.QuestionBoardService;
import service.question_board_reply.QuestionBoardReplyService;
import vo.AllBoardVo;
import vo.FreeBoardVo;
import vo.QuestionBoardReplyVo;
import vo.QuestionBoardVo;
import vo.MembershipVo;

@Controller
@RequestMapping("/question_board")
public class QuestionBoardController {
	
	AllBoardService abSelectCount, abSelectList;
	QuestionBoardService qbSelectCount, qbSelectList, qbSelectView, qbUpdateReadCount, qbInsertBoard,
					qbUpdateBoard, qbDownload, qbDelete, qbRecommendationCount,
					qbInsertRecommendationCount, qbUpdateRecommendationCount, qbUpdateNotRecommendationCount;
	QuestionBoardReplyService qbSelectReplyList, qbSelectReplyCount, qbInsertReplyBoard, qbUpdateReplyCount,
					qbUpdateBoardReply, qbDeleteReply;
	
	@Autowired
	public void setAbSelectCount(@Qualifier("abSelectCount") AllBoardService abSelectCount) {
		this.abSelectCount = abSelectCount;
	}
	
	@Autowired
	public void setAbSelectList(@Qualifier("abSelectList") AllBoardService abSelectList) {
		this.abSelectList = abSelectList;
	}
	
	@Autowired
	public void setQbSelectCount(@Qualifier("qbSelectCount") QuestionBoardService qbSelectCount) {
		this.qbSelectCount = qbSelectCount;
	}
	
	@Autowired
	public void setQbSelectList(@Qualifier("qbSelectList") QuestionBoardService qbSelectList) {
		this.qbSelectList = qbSelectList;
	}
		
	@Autowired
	public void setQbUpdateReadCount(@Qualifier("qbUpdateReadCount") QuestionBoardService qbUpdateReadCount) {
		this.qbUpdateReadCount = qbUpdateReadCount;
	}
	
	@Autowired
	public void setQbSelectView(@Qualifier("qbSelectView") QuestionBoardService qbSelectView) {
		this.qbSelectView = qbSelectView;
	}
	
	@Autowired
	public void setQbInsertBoard(@Qualifier("qbInsertBoard") QuestionBoardService qbInsertBoard) {
		this.qbInsertBoard = qbInsertBoard;
	}
	
	@Autowired
	public void setQbUpdateBoard(@Qualifier("qbUpdateBoard") QuestionBoardService qbUpdateBoard) {
		this.qbUpdateBoard = qbUpdateBoard;
	}
	
	@Autowired
	public void setQbDownload(@Qualifier("qbDownload") QuestionBoardService qbDownload) {
		this.qbDownload = qbDownload;
	}
	
	@Autowired
	public void setQbDelete(@Qualifier("qbDelete") QuestionBoardService qbDelete) {
		this.qbDelete = qbDelete;
	}
	
	@Autowired
	public void setQbRecommendationCount(@Qualifier("qbRecommendationCount") QuestionBoardService qbRecommendationCount) {
		this.qbRecommendationCount = qbRecommendationCount;
	}
	
	@Autowired
	public void setQbInsertRecommendationCount(@Qualifier("qbInsertRecommendationCount") QuestionBoardService qbInsertRecommendationCount) {
		this.qbInsertRecommendationCount = qbInsertRecommendationCount;
	}
	
	@Autowired
	public void setQbUpdateRecommendationCount(@Qualifier("qbUpdateRecommendationCount") QuestionBoardService qbUpdateRecommendationCount) {
		this.qbUpdateRecommendationCount = qbUpdateRecommendationCount;
	}
	
	@Autowired
	public void setQbUpdateNotRecommendationCount(@Qualifier("qbUpdateNotRecommendationCount") QuestionBoardService qbUpdateNotRecommendationCount) {
		this.qbUpdateNotRecommendationCount = qbUpdateNotRecommendationCount;
	}
	
	@Autowired
	public void setQbSelectReplyList(@Qualifier("qbSelectReplyList") QuestionBoardReplyService qbSelectReplyList) {
		this.qbSelectReplyList = qbSelectReplyList;
	}
	
	@Autowired
	public void setQbSelectReplyCount(@Qualifier("qbSelectReplyCount") QuestionBoardReplyService qbSelectReplyCount) {
		this.qbSelectReplyCount = qbSelectReplyCount;
	}
	
	@Autowired
	public void setQbInsertReplyBoard(@Qualifier("qbInsertReplyBoard") QuestionBoardReplyService qbInsertReplyBoard) {
		this.qbInsertReplyBoard = qbInsertReplyBoard;
	}
	
	@Autowired
	public void setQbUpdateReplyCount(@Qualifier("qbUpdateReplyCount") QuestionBoardReplyService qbUpdateReplyCount) {
		this.qbUpdateReplyCount = qbUpdateReplyCount;
	}
	
	@Autowired
	public void setQbUpdateBoardReply(@Qualifier("qbUpdateBoardReply") QuestionBoardReplyService qbUpdateBoardReply) {
		this.qbUpdateBoardReply = qbUpdateBoardReply;
	}
	
	@Autowired
	public void setQbDeleteReply(@Qualifier("qbDeleteReply") QuestionBoardReplyService qbDeleteReply) {
		this.qbDeleteReply = qbDeleteReply;
	}
	
	@GetMapping("/list.do")
	public String list(HttpServletRequest request, Model model) {
		

		//사용자가 입력한 검색 조건을 Map에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}

		List<QuestionBoardVo> boardList = qbSelectList.selectList(map);//게시물 목록
		model.addAttribute("boardList",boardList);
		
		int totalRows = qbSelectCount.selectCount(map);//게시물 수
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
		
		return "question_board/list";
	}
	
	@GetMapping("/list20.do")
	public String list20(HttpServletRequest request, Model model) {
		

		//사용자가 입력한 검색 조건을 Map에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}

		List<QuestionBoardVo> boardList = qbSelectList.selectList(map);//게시물 목록
		model.addAttribute("boardList",boardList);
		
		int totalRows = qbSelectCount.selectCount(map);//게시물 수
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
		
		return "question_board/list20";
	}
	
	@GetMapping("/list30.do")
	public String list30(HttpServletRequest request, Model model) {
		

		//사용자가 입력한 검색 조건을 Map에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}

		List<QuestionBoardVo> boardList = qbSelectList.selectList(map);//게시물 목록
		model.addAttribute("boardList",boardList);
		
		int totalRows = qbSelectCount.selectCount(map);//게시물 수
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
		
		return "question_board/list30";
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
	
	@GetMapping("/view.do")
	public String view(HttpServletRequest request, Model model) {
		
		int board_idx = Integer.parseInt(request.getParameter("no"));  // 일련번호 받기 
		
		qbUpdateReadCount.updateReadCount(board_idx); //조회수증가
		QuestionBoardVo vo = qbSelectView.selectView(board_idx); //게시물 가져오기
					
		model.addAttribute("questionBoardVo", vo);
		
		List<QuestionBoardReplyVo> boardReplyList = qbSelectReplyList.selectReplyList(board_idx);//댓글 목록
		int totalRows = qbSelectReplyCount.selectReplyCount(board_idx); //댓글 수
		
		model.addAttribute("boardReplyList", boardReplyList);
		
		Map<String, Object> map = new HashMap<String, Object>();
		String searchTotal = request.getParameter("searchTotal");
		
		if(searchTotal != null){
		    map.put("searchTotal", searchTotal);
		}
		
		List<AllBoardVo> searchList = abSelectList.selectList(map);//게시물 목록
		model.addAttribute("searchList",searchList);
		
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
		model.addAttribute("searchTotal",searchTotal);
		
		return "question_board/view";
	}
	
	@GetMapping("/write.do")
	public String write(HttpServletRequest request, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		String searchTotal = request.getParameter("searchTotal");
		
		if(searchTotal != null){
		    map.put("searchTotal", searchTotal);
		}
		
		List<AllBoardVo> searchList = abSelectList.selectList(map);//게시물 목록
		model.addAttribute("searchList",searchList);
		
		return "question_board/write";
	}
	
	@PostMapping("/write_process.do")
	public String write_process(@RequestParam("attachedFile") MultipartFile attachedFile,
			String member_nickname, String member_idx, String title, String content,
			HttpServletRequest request) {
		String viewPage = "question_board/write"; // 글등록 실패시 보여지는 페이지
		
		//첨부파일과 함께 글내용 저장을 BoardFileInsertService클래스 이용
		int result = qbInsertBoard.insertBoard(attachedFile, member_nickname, member_idx, title, content, request);
		
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}

		List<QuestionBoardVo> boardList = qbSelectList.selectList(map);//게시물 목록
		int board_idx = boardList.get(0).getBoard_idx();
		
		if(result == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:../question_board/view.do?no="+board_idx;
		}
		return viewPage;
	}
	
	@GetMapping("/edit.do")
	public String edit(HttpServletRequest request, @RequestParam("no") int board_idx, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		String searchTotal = request.getParameter("searchTotal");
		
		if(searchTotal != null){
		    map.put("searchTotal", searchTotal);
		}
		
		List<AllBoardVo> searchList = abSelectList.selectList(map);
		model.addAttribute("searchList",searchList);
		
		//게시물 가져오기 - BoardFileViewService 클래스 이용
		QuestionBoardVo vo = qbSelectView.selectView(board_idx);
		model.addAttribute("questionboardVo", vo);
		
		return "question_board/edit";
	}
	
	@PostMapping("/edit_process.do")
	public String edit_process(@RequestParam("attachedFile") MultipartFile attachedFile,
			int board_idx, String title, String content,
			HttpServletRequest request, Model model) {
		String viewPage = "question_board/edit"; // 글수정 실패시 보여지는 페이지
		
		//첨부파일과 함께 글내용 수정을 BoardFileUpdateService클래스 이용
		int result = qbUpdateBoard.updateBoard(attachedFile, board_idx, title, content, request);
		
		if(result == 1) {//글수정 성공시 보여지는 페이지
			QuestionBoardVo vo = qbSelectView.selectView(board_idx);
			model.addAttribute("questionBoardVo", vo);
			
			List<QuestionBoardReplyVo> boardReplyList = qbSelectReplyList.selectReplyList(board_idx);//댓글 목록
			int totalRows = qbSelectReplyCount.selectReplyCount(board_idx); //댓글 수
			
			model.addAttribute("boardReplyList", boardReplyList);
			
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
			
			viewPage = "question_board/view";
		}
		return viewPage;
	}
	
	@GetMapping("/download.do")
	public void download(String oName, String sName,
			HttpServletRequest request, HttpServletResponse response) {
		//request객체는 파일의 실제 저장경로를 알아내는데 필요하고,
		//response객체는 파일을 출력하는데 필요함
		
		//파일 다운로드 요청 처리는 BoardFileDownService 클래스 이용
		qbDownload.download(oName, sName, request, response);
	}
	
	@PostMapping("/delete_process.do")
	public String delete_process(@RequestParam("no") int board_idx, 
			HttpServletRequest request) {
		
		int result = qbDelete.deletePost(board_idx, request);
		
		String viewPage = "question_board/view";
		
		if(result == 1) {
			viewPage = "redirect:/question_board/list.do";
			
		}
		
		return viewPage;
	}
	
	@PostMapping("/rd_up_process.do")
	@ResponseBody
	public Object rd_up_process(@RequestParam("no") int board_idx, 
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		int count = qbRecommendationCount.recommendationCount(board_idx, request);
		
		if(count == 0) {
			int temp = qbInsertRecommendationCount.insertRecommendationCount(board_idx, request);
			
			if(temp == 1) {
				qbUpdateRecommendationCount.updateRecommendationCount(board_idx);
				QuestionBoardVo vo = qbSelectView.selectView(board_idx);
				String rd_up_count = String.valueOf(vo.getRecommendation_count());
				result.put("result", "success");
				result.put("rd_up_count", rd_up_count);
			}else {
				result.put("result", "fail");
			}
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	@PostMapping("/rd_down_process.do")
	@ResponseBody
	public Object rd_down_process(@RequestParam("no") int board_idx, 
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		int count = qbRecommendationCount.recommendationCount(board_idx, request);
		
		if(count == 0) {
			int temp = qbInsertRecommendationCount.insertRecommendationCount(board_idx, request);
			
			if(temp == 1) {
				qbUpdateNotRecommendationCount.updateNotRecommendationCount(board_idx);
				QuestionBoardVo vo = qbSelectView.selectView(board_idx);
				String rd_down_count = String.valueOf(vo.getNot_recommendation_count());
				result.put("result", "success");
				result.put("rd_down_count", rd_down_count);
				
			}else {
	        	result.put("result", "fail");
	        }
		}else {
        	result.put("result", "fail");
        }
				
		return result;
		
	}
	
	@PostMapping("/reply_write_process.do")
	public String reply_write_process(String board_idx, String member_nickname, 
			String member_idx, String content) {
		String viewPage = "question_board/view";
		
		//첨부파일과 함께 글내용 저장을 BoardFileInsertService클래스 이용
		int result = qbInsertReplyBoard.insertReplyBoard(board_idx, member_nickname, member_idx, content);
		qbUpdateReplyCount.updateReplyCount(Integer.parseInt(board_idx));
				
		if(result == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:../question_board/view.do?no="+board_idx;
		}
		return viewPage;
	}
	
	@PostMapping("/reply_edit_process.do")
	public String reply_edit_process(String board_idx, String reply_idx, String content) {
		String viewPage = "question_board/view";
		
		//첨부파일과 함께 글내용 저장을 BoardFileInsertService클래스 이용
		int result = qbUpdateBoardReply.updateBoardReply(Integer.parseInt(reply_idx), content);
				
		if(result == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:../question_board/view.do?no="+board_idx;
		}
		return viewPage;
	}
	
	@PostMapping("/reply_delete_process.do")
	public String reply_delete_process(String board_idx, String reply_idx, 
			HttpServletRequest request) {
		
		String viewPage = "question_board/view";
		int result = qbDeleteReply.deleteReply(Integer.parseInt(reply_idx), request);
		
		if(result == 1) {//글등록 성공시 보여지는 페이지
			qbUpdateReplyCount.updateReplyCount(Integer.parseInt(board_idx));
			viewPage = "redirect:../question_board/view.do?no="+board_idx;
		}
		
		return viewPage;
	}
	
}
