package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import service.free_board.FreeBoardService;
import service.free_board_reply.FreeBoardReplyService;
import vo.AllBoardVo;
import vo.FreeBoardReplyVo;
import vo.FreeBoardVo;

@Controller
@RequestMapping("/free_board")
public class FreeBoardController {
	
	AllBoardService abSelectCount, abSelectList;
	FreeBoardService fbSelectCount, fbSelectList, fbSelectView, fbUpdateReadCount, fbInsertBoard,
					fbUpdateBoard, fbDownload, fbDelete, fbRecommendationCount,
					fbInsertRecommendationCount, fbUpdateRecommendationCount, fbUpdateNotRecommendationCount;
	FreeBoardReplyService fbSelectReplyList, fbSelectReplyCount, fbInsertReplyBoard, fbUpdateReplyCount,
					fbUpdateBoardReply, fbDeleteReply;
	
	@Autowired
	public void setAbSelectCount(@Qualifier("abSelectCount") AllBoardService abSelectCount) {
		this.abSelectCount = abSelectCount;
	}
	
	@Autowired
	public void setAbSelectList(@Qualifier("abSelectList") AllBoardService abSelectList) {
		this.abSelectList = abSelectList;
	}
	
	@Autowired
	public void setFbSelectCount(@Qualifier("fbSelectCount") FreeBoardService fbSelectCount) {
		this.fbSelectCount = fbSelectCount;
	}
	
	@Autowired
	public void setFbSelectList(@Qualifier("fbSelectList") FreeBoardService fbSelectList) {
		this.fbSelectList = fbSelectList;
	}
		
	@Autowired
	public void setFbUpdateReadCount(@Qualifier("fbUpdateReadCount") FreeBoardService fbUpdateReadCount) {
		this.fbUpdateReadCount = fbUpdateReadCount;
	}
	
	@Autowired
	public void setFbSelectView(@Qualifier("fbSelectView") FreeBoardService fbSelectView) {
		this.fbSelectView = fbSelectView;
	}
	
	@Autowired
	public void setFbInsertBoard(@Qualifier("fbInsertBoard") FreeBoardService fbInsertBoard) {
		this.fbInsertBoard = fbInsertBoard;
	}
	
	@Autowired
	public void setFbUpdateBoard(@Qualifier("fbUpdateBoard") FreeBoardService fbUpdateBoard) {
		this.fbUpdateBoard = fbUpdateBoard;
	}
	
	@Autowired
	public void setFbDownload(@Qualifier("fbDownload") FreeBoardService fbDownload) {
		this.fbDownload = fbDownload;
	}
	
	@Autowired
	public void setFbDelete(@Qualifier("fbDelete") FreeBoardService fbDelete) {
		this.fbDelete = fbDelete;
	}
	
	@Autowired
	public void setFbRecommendationCount(@Qualifier("fbRecommendationCount") FreeBoardService fbRecommendationCount) {
		this.fbRecommendationCount = fbRecommendationCount;
	}
	
	@Autowired
	public void setFbInsertRecommendationCount(@Qualifier("fbInsertRecommendationCount") FreeBoardService fbInsertRecommendationCount) {
		this.fbInsertRecommendationCount = fbInsertRecommendationCount;
	}
	
	@Autowired
	public void setFbUpdateRecommendationCount(@Qualifier("fbUpdateRecommendationCount") FreeBoardService fbUpdateRecommendationCount) {
		this.fbUpdateRecommendationCount = fbUpdateRecommendationCount;
	}
	
	@Autowired
	public void setFbUpdateNotRecommendationCount(@Qualifier("fbUpdateNotRecommendationCount") FreeBoardService fbUpdateNotRecommendationCount) {
		this.fbUpdateNotRecommendationCount = fbUpdateNotRecommendationCount;
	}
	
	@Autowired
	public void setFbSelectReplyList(@Qualifier("fbSelectReplyList") FreeBoardReplyService fbSelectReplyList) {
		this.fbSelectReplyList = fbSelectReplyList;
	}
	
	@Autowired
	public void setFbSelectReplyCount(@Qualifier("fbSelectReplyCount") FreeBoardReplyService fbSelectReplyCount) {
		this.fbSelectReplyCount = fbSelectReplyCount;
	}
	
	@Autowired
	public void setFbInsertReplyBoard(@Qualifier("fbInsertReplyBoard") FreeBoardReplyService fbInsertReplyBoard) {
		this.fbInsertReplyBoard = fbInsertReplyBoard;
	}
	
	@Autowired
	public void setFbUpdateReplyCount(@Qualifier("fbUpdateReplyCount") FreeBoardReplyService fbUpdateReplyCount) {
		this.fbUpdateReplyCount = fbUpdateReplyCount;
	}
	
	@Autowired
	public void setFbUpdateBoardReply(@Qualifier("fbUpdateBoardReply") FreeBoardReplyService fbUpdateBoardReply) {
		this.fbUpdateBoardReply = fbUpdateBoardReply;
	}
	
	@Autowired
	public void setFbDeleteReply(@Qualifier("fbDeleteReply") FreeBoardReplyService fbDeleteReply) {
		this.fbDeleteReply = fbDeleteReply;
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

		List<FreeBoardVo> boardList = fbSelectList.selectList(map);//게시물 목록
		model.addAttribute("boardList",boardList);
		
		int totalRows = fbSelectCount.selectCount(map);//게시물 수
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
		
		return "free_board/list";
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

		List<FreeBoardVo> boardList = fbSelectList.selectList(map);//게시물 목록
		model.addAttribute("boardList",boardList);
		
		int totalRows = fbSelectCount.selectCount(map);//게시물 수
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
		
		return "free_board/list20";
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

		List<FreeBoardVo> boardList = fbSelectList.selectList(map);//게시물 목록
		model.addAttribute("boardList",boardList);
		
		int totalRows = fbSelectCount.selectCount(map);//게시물 수
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
		
		return "free_board/list30";
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
		
		fbUpdateReadCount.updateReadCount(board_idx); //조회수증가
		FreeBoardVo vo = fbSelectView.selectView(board_idx); //게시물 가져오기
					
		model.addAttribute("freeBoardVo", vo);
		
		List<FreeBoardReplyVo> boardReplyList = fbSelectReplyList.selectReplyList(board_idx);//댓글 목록
		int totalRows = fbSelectReplyCount.selectReplyCount(board_idx); //댓글 수
		
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
		
		return "free_board/view";
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
		
		return "free_board/write";
	}
	
	@PostMapping("/write_process.do")
	public String write_process(@RequestParam("attachedFile") MultipartFile attachedFile,
			String member_nickname, String member_idx, String title, String content,
			HttpServletRequest request) {
		String viewPage = "free_board/write"; // 글등록 실패시 보여지는 페이지
		
		//첨부파일과 함께 글내용 저장을 BoardFileInsertService클래스 이용
		int result = fbInsertBoard.insertBoard(attachedFile, member_nickname, member_idx, title, content, request);
		
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}

		List<FreeBoardVo> boardList = fbSelectList.selectList(map);//게시물 목록
		int board_idx = boardList.get(0).getBoard_idx();
		
		if(result == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:../free_board/view.do?no="+board_idx;
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
		FreeBoardVo vo = fbSelectView.selectView(board_idx);
		model.addAttribute("freeboardVo", vo);
		
		return "free_board/edit";
	}
	
	@PostMapping("/edit_process.do")
	public String edit_process(@RequestParam("attachedFile") MultipartFile attachedFile,
			int board_idx, String title, String content,
			HttpServletRequest request, Model model) {
		String viewPage = "free_board/edit"; // 글수정 실패시 보여지는 페이지
		
		//첨부파일과 함께 글내용 수정을 BoardFileUpdateService클래스 이용
		int result = fbUpdateBoard.updateBoard(attachedFile, board_idx, title, content, request);
		
		if(result == 1) {//글수정 성공시 보여지는 페이지
			FreeBoardVo vo = fbSelectView.selectView(board_idx);
			model.addAttribute("freeBoardVo", vo);
			
			List<FreeBoardReplyVo> boardReplyList = fbSelectReplyList.selectReplyList(board_idx);//댓글 목록
			int totalRows = fbSelectReplyCount.selectReplyCount(board_idx); //댓글 수
			
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
			
			viewPage = "free_board/view";
		}
		return viewPage;
	}
	
	@GetMapping("/download.do")
	public void download(String oName, String sName,
			HttpServletRequest request, HttpServletResponse response) {
		//request객체는 파일의 실제 저장경로를 알아내는데 필요하고,
		//response객체는 파일을 출력하는데 필요함
		
		//파일 다운로드 요청 처리는 BoardFileDownService 클래스 이용
		fbDownload.download(oName, sName, request, response);
	}
	
	@PostMapping("/delete_process.do")
	public String delete_process(@RequestParam("no") int board_idx, 
			HttpServletRequest request) {
		
		int result = fbDelete.deletePost(board_idx, request);
		
		String viewPage = "free_board/view";
		
		if(result == 1) {
			viewPage = "redirect:/free_board/list.do";
			
		}
		
		return viewPage;
	}
	
	@PostMapping("/rd_up_process.do")
	@ResponseBody
	public Object rd_up_process(@RequestParam("no") int board_idx, 
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		int count = fbRecommendationCount.recommendationCount(board_idx, request);
		
		if(count == 0) {
			int temp = fbInsertRecommendationCount.insertRecommendationCount(board_idx, request);
			
			if(temp == 1) {
				fbUpdateRecommendationCount.updateRecommendationCount(board_idx);
				FreeBoardVo vo = fbSelectView.selectView(board_idx);
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
		
		int count = fbRecommendationCount.recommendationCount(board_idx, request);
	    
	    if (count == 0) {
	        int temp = fbInsertRecommendationCount.insertRecommendationCount(board_idx, request);
	        
	        if (temp == 1) {
	        	fbUpdateNotRecommendationCount.updateNotRecommendationCount(board_idx);
	        	FreeBoardVo vo = fbSelectView.selectView(board_idx);
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
		String viewPage = "free_board/view";
		
		//첨부파일과 함께 글내용 저장을 BoardFileInsertService클래스 이용
		int result = fbInsertReplyBoard.insertReplyBoard(board_idx, member_nickname, member_idx, content);
		fbUpdateReplyCount.updateReplyCount(Integer.parseInt(board_idx));
				
		if(result == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:../free_board/view.do?no="+board_idx;
		}
		return viewPage;
	}
	
	@PostMapping("/reply_edit_process.do")
	public String reply_edit_process(String board_idx, String reply_idx, String content) {
		String viewPage = "free_board/view";
		
		//첨부파일과 함께 글내용 저장을 BoardFileInsertService클래스 이용
		int result = fbUpdateBoardReply.updateBoardReply(Integer.parseInt(reply_idx), content);
				
		if(result == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:../free_board/view.do?no="+board_idx;
		}
		return viewPage;
	}
	
	@PostMapping("/reply_delete_process.do")
	public String reply_delete_process(String board_idx, String reply_idx, 
			HttpServletRequest request) {
		
		String viewPage = "free_board/view";
		int result = fbDeleteReply.deleteReply(Integer.parseInt(reply_idx), request);
		
		if(result == 1) {//글등록 성공시 보여지는 페이지
			fbUpdateReplyCount.updateReplyCount(Integer.parseInt(board_idx));
			viewPage = "redirect:../free_board/view.do?no="+board_idx;
		}
		
		return viewPage;
	}
	
}
