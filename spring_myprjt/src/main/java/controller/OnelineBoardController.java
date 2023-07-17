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
import org.springframework.web.multipart.MultipartFile;
import service.all_board.AllBoardService;
import service.oneline_board.OnelineBoardService;
import service.oneline_board_reply.OnelineBoardReplyService;
import vo.AllBoardVo;
import vo.OnelineBoardReplyVo;
import vo.OnelineBoardVo;
import vo.MembershipVo;

@Controller
@RequestMapping("/oneline_board")
public class OnelineBoardController {
	
	AllBoardService abSelectCount, abSelectList;
	OnelineBoardService obSelectCount, obSelectList, obSelectView, obUpdateReadCount, obInsertBoard,
					obUpdateBoard, obDownload, obDelete, obRecommendationCount,
					obInsertRecommendationCount, obUpdateRecommendationCount, obUpdateNotRecommendationCount;
	OnelineBoardReplyService obSelectReplyList, obSelectReplyCount, obInsertReplyBoard, obUpdateReplyCount,
					obUpdateBoardReply, obDeleteReply;
	
	@Autowired
	public void setAbSelectCount(@Qualifier("abSelectCount") AllBoardService abSelectCount) {
		this.abSelectCount = abSelectCount;
	}
	
	@Autowired
	public void setAbSelectList(@Qualifier("abSelectList") AllBoardService abSelectList) {
		this.abSelectList = abSelectList;
	}
	
	@Autowired
	public void setObSelectCount(@Qualifier("obSelectCount") OnelineBoardService obSelectCount) {
		this.obSelectCount = obSelectCount;
	}
	
	@Autowired
	public void setObSelectList(@Qualifier("obSelectList") OnelineBoardService obSelectList) {
		this.obSelectList = obSelectList;
	}
		
	@Autowired
	public void setObUpdateReadCount(@Qualifier("obUpdateReadCount") OnelineBoardService obUpdateReadCount) {
		this.obUpdateReadCount = obUpdateReadCount;
	}
	
	@Autowired
	public void setObSelectView(@Qualifier("obSelectView") OnelineBoardService obSelectView) {
		this.obSelectView = obSelectView;
	}
	
	@Autowired
	public void setObInsertBoard(@Qualifier("obInsertBoard") OnelineBoardService obInsertBoard) {
		this.obInsertBoard = obInsertBoard;
	}
	
	@Autowired
	public void setObUpdateBoard(@Qualifier("obUpdateBoard") OnelineBoardService obUpdateBoard) {
		this.obUpdateBoard = obUpdateBoard;
	}
	
	@Autowired
	public void setObDownload(@Qualifier("obDownload") OnelineBoardService obDownload) {
		this.obDownload = obDownload;
	}
	
	@Autowired
	public void setObDelete(@Qualifier("obDelete") OnelineBoardService obDelete) {
		this.obDelete = obDelete;
	}
	
	@Autowired
	public void setObRecommendationCount(@Qualifier("obRecommendationCount") OnelineBoardService obRecommendationCount) {
		this.obRecommendationCount = obRecommendationCount;
	}
	
	@Autowired
	public void setObInsertRecommendationCount(@Qualifier("obInsertRecommendationCount") OnelineBoardService obInsertRecommendationCount) {
		this.obInsertRecommendationCount = obInsertRecommendationCount;
	}
	
	@Autowired
	public void setObUpdateRecommendationCount(@Qualifier("obUpdateRecommendationCount") OnelineBoardService obUpdateRecommendationCount) {
		this.obUpdateRecommendationCount = obUpdateRecommendationCount;
	}
	
	@Autowired
	public void setObUpdateNotRecommendationCount(@Qualifier("obUpdateNotRecommendationCount") OnelineBoardService obUpdateNotRecommendationCount) {
		this.obUpdateNotRecommendationCount = obUpdateNotRecommendationCount;
	}
	
	@Autowired
	public void setObSelectReplyList(@Qualifier("obSelectReplyList") OnelineBoardReplyService obSelectReplyList) {
		this.obSelectReplyList = obSelectReplyList;
	}
	
	@Autowired
	public void setObSelectReplyCount(@Qualifier("obSelectReplyCount") OnelineBoardReplyService obSelectReplyCount) {
		this.obSelectReplyCount = obSelectReplyCount;
	}
	
	@Autowired
	public void setObInsertReplyBoard(@Qualifier("obInsertReplyBoard") OnelineBoardReplyService obInsertReplyBoard) {
		this.obInsertReplyBoard = obInsertReplyBoard;
	}
	
	@Autowired
	public void setObUpdateReplyCount(@Qualifier("obUpdateReplyCount") OnelineBoardReplyService obUpdateReplyCount) {
		this.obUpdateReplyCount = obUpdateReplyCount;
	}
	
	@Autowired
	public void setObUpdateBoardReply(@Qualifier("obUpdateBoardReply") OnelineBoardReplyService obUpdateBoardReply) {
		this.obUpdateBoardReply = obUpdateBoardReply;
	}
	
	@Autowired
	public void setObDeleteReply(@Qualifier("obDeleteReply") OnelineBoardReplyService obDeleteReply) {
		this.obDeleteReply = obDeleteReply;
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

		List<OnelineBoardVo> boardList = obSelectList.selectList(map);//게시물 목록
		model.addAttribute("boardList",boardList);
		
		int totalRows = obSelectCount.selectCount(map);//게시물 수
		model.addAttribute("totalRows",totalRows);
		
		int rows_per_page = 2;
		int pages_per_block = 1;
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
		
		return "oneline_board/list";
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
		
		obUpdateReadCount.updateReadCount(board_idx); //조회수증가
		OnelineBoardVo vo = obSelectView.selectView(board_idx); //게시물 가져오기
					
		model.addAttribute("onelineBoardVo", vo);
		
		List<OnelineBoardReplyVo> boardReplyList = obSelectReplyList.selectReplyList(board_idx);//댓글 목록
		int totalRows = obSelectReplyCount.selectReplyCount(board_idx); //댓글 수
		
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
		
		return "oneline_board/view";
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
		
		return "oneline_board/write";
	}
	
	@PostMapping("/write_process.do")
	public String write_process(@RequestParam("attachedFile") MultipartFile attachedFile,
			String member_nickname, String member_idx, String title, String content,
			HttpServletRequest request) {
		String viewPage = "oneline_board/write"; // 글등록 실패시 보여지는 페이지
		
		//첨부파일과 함께 글내용 저장을 BoardFileInsertService클래스 이용
		int result = obInsertBoard.insertBoard(attachedFile, member_nickname, member_idx, title, content, request);
		
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}

		List<OnelineBoardVo> boardList = obSelectList.selectList(map);//게시물 목록
		int board_idx = boardList.get(0).getBoard_idx();
		
		if(result == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:../oneline_board/view.do?no="+board_idx;
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
		OnelineBoardVo vo = obSelectView.selectView(board_idx);
		model.addAttribute("onelineboardVo", vo);
		
		return "oneline_board/edit";
	}
	
	@PostMapping("/edit_process.do")
	public String edit_process(@RequestParam("attachedFile") MultipartFile attachedFile,
			int board_idx, String title, String content,
			HttpServletRequest request, Model model) {
		String viewPage = "oneline_board/edit"; // 글수정 실패시 보여지는 페이지
		
		//첨부파일과 함께 글내용 수정을 BoardFileUpdateService클래스 이용
		int result = obUpdateBoard.updateBoard(attachedFile, board_idx, title, content, request);
		
		if(result == 1) {//글수정 성공시 보여지는 페이지
			OnelineBoardVo vo = obSelectView.selectView(board_idx);
			model.addAttribute("onelineBoardVo", vo);
			
			List<OnelineBoardReplyVo> boardReplyList = obSelectReplyList.selectReplyList(board_idx);//댓글 목록
			int totalRows = obSelectReplyCount.selectReplyCount(board_idx); //댓글 수
			
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
			
			viewPage = "oneline_board/view";
		}
		return viewPage;
	}
	
	@GetMapping("/download.do")
	public void download(String oName, String sName,
			HttpServletRequest request, HttpServletResponse response) {
		//request객체는 파일의 실제 저장경로를 알아내는데 필요하고,
		//response객체는 파일을 출력하는데 필요함
		
		//파일 다운로드 요청 처리는 BoardFileDownService 클래스 이용
		obDownload.download(oName, sName, request, response);
	}
	
	@PostMapping("/delete_process.do")
	public String delete_process(@RequestParam("no") int board_idx, 
			HttpServletRequest request) {
		
		int result = obDelete.deletePost(board_idx, request);
		
		String viewPage = "oneline_board/view";
		
		if(result == 1) {
			viewPage = "redirect:/oneline_board/list.do";
			
		}
		
		return viewPage;
	}
	
	@PostMapping("/rd_up_process.do")
	public String rd_up_process(@RequestParam("no") int board_idx, 
			HttpServletRequest request, Model model) {
						
		int result = obRecommendationCount.recommendationCount(board_idx, request);
		String viewPage = "oneline_board/view";
		
		if(result == 0) {
			int temp = obInsertRecommendationCount.insertRecommendationCount(board_idx, request);
			
			if(temp == 1) {
				obUpdateRecommendationCount.updateRecommendationCount(board_idx);			
			}
		}
		
		OnelineBoardVo vo = obSelectView.selectView(board_idx);
		model.addAttribute("onelineBoardVo", vo);
		
		List<OnelineBoardReplyVo> boardReplyList = obSelectReplyList.selectReplyList(board_idx);//댓글 목록
		int totalRows = obSelectReplyCount.selectReplyCount(board_idx); //댓글 수
		
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
		
		viewPage = "oneline_board/view";
		
		return viewPage;
		
	}
	
	@PostMapping("/rd_down_process.do")
	public String rd_down_process(@RequestParam("no") int board_idx, 
			HttpServletRequest request, Model model) {
						
		int result = obRecommendationCount.recommendationCount(board_idx, request);
		String viewPage = "oneline_board/view";
		
		if(result == 0) {
			int temp = obInsertRecommendationCount.insertRecommendationCount(board_idx, request);
			
			if(temp == 1) {
				obUpdateNotRecommendationCount.updateNotRecommendationCount(board_idx);			
			}
		}
		
		OnelineBoardVo vo = obSelectView.selectView(board_idx);
		model.addAttribute("onelineBoardVo", vo);
		
		List<OnelineBoardReplyVo> boardReplyList = obSelectReplyList.selectReplyList(board_idx);//댓글 목록
		int totalRows = obSelectReplyCount.selectReplyCount(board_idx); //댓글 수
		
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
		
		viewPage = "oneline_board/view";
		
		return viewPage;
		
	}
	
	@PostMapping("/reply_write_process.do")
	public String reply_write_process(String board_idx, String member_nickname, 
			String member_idx, String content, String del_or_not) {
		String viewPage = "oneline_board/view";
		
		//첨부파일과 함께 글내용 저장을 BoardFileInsertService클래스 이용
		int result = obInsertReplyBoard.insertReplyBoard(board_idx, member_nickname, member_idx, content, del_or_not);
		obUpdateReplyCount.updateReplyCount(Integer.parseInt(board_idx));
				
		if(result == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:../oneline_board/view.do?no="+board_idx;
		}
		return viewPage;
	}
	
	@PostMapping("/reply_edit_process.do")
	public String reply_edit_process(String board_idx, String reply_idx, String content, String del_or_not) {
		String viewPage = "oneline_board/view";
		
		//첨부파일과 함께 글내용 저장을 BoardFileInsertService클래스 이용
		int result = obUpdateBoardReply.updateBoardReply(Integer.parseInt(reply_idx), content, del_or_not);
				
		if(result == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:../oneline_board/view.do?no="+board_idx;
		}
		return viewPage;
	}
	
	@PostMapping("/reply_delete_process.do")
	public String reply_delete_process(String board_idx, String reply_idx, 
			HttpServletRequest request) {
		
		String viewPage = "oneline_board/view";
		int result = obDeleteReply.deleteReply(Integer.parseInt(reply_idx), request);
		
		if(result == 1) {//글등록 성공시 보여지는 페이지
			obUpdateReplyCount.updateReplyCount(Integer.parseInt(board_idx));
			viewPage = "redirect:../oneline_board/view.do?no="+board_idx;
		}
		
		return viewPage;
	}
	
}
