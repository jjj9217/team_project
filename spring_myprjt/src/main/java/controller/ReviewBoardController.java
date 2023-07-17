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
import service.review_board.ReviewBoardService;
import service.review_board_reply.ReviewBoardReplyService;
import vo.AllBoardVo;
import vo.FreeBoardVo;
import vo.ReviewBoardReplyVo;
import vo.ReviewBoardVo;
import vo.MembershipVo;

@Controller
@RequestMapping("/review_board")
public class ReviewBoardController {
	
	AllBoardService abSelectCount, abSelectList;
	ReviewBoardService rbSelectCount, rbSelectList, rbSelectView, rbUpdateReadCount, rbInsertBoard,
					rbUpdateBoard, rbDownload, rbDelete, rbRecommendationCount,
					rbInsertRecommendationCount, rbUpdateRecommendationCount, rbUpdateNotRecommendationCount;
	ReviewBoardReplyService rbSelectReplyList, rbSelectReplyCount, rbInsertReplyBoard, rbUpdateReplyCount,
					rbUpdateBoardReply, rbDeleteReply;
	
	@Autowired
	public void setAbSelectCount(@Qualifier("abSelectCount") AllBoardService abSelectCount) {
		this.abSelectCount = abSelectCount;
	}
	
	@Autowired
	public void setAbSelectList(@Qualifier("abSelectList") AllBoardService abSelectList) {
		this.abSelectList = abSelectList;
	}
	
	@Autowired
	public void setRbSelectCount(@Qualifier("rbSelectCount") ReviewBoardService rbSelectCount) {
		this.rbSelectCount = rbSelectCount;
	}
	
	@Autowired
	public void setRbSelectList(@Qualifier("rbSelectList") ReviewBoardService rbSelectList) {
		this.rbSelectList = rbSelectList;
	}
		
	@Autowired
	public void setRbUpdateReadCount(@Qualifier("rbUpdateReadCount") ReviewBoardService rbUpdateReadCount) {
		this.rbUpdateReadCount = rbUpdateReadCount;
	}
	
	@Autowired
	public void setRbSelectView(@Qualifier("rbSelectView") ReviewBoardService rbSelectView) {
		this.rbSelectView = rbSelectView;
	}
	
	@Autowired
	public void setRbInsertBoard(@Qualifier("rbInsertBoard") ReviewBoardService rbInsertBoard) {
		this.rbInsertBoard = rbInsertBoard;
	}
	
	@Autowired
	public void setRbUpdateBoard(@Qualifier("rbUpdateBoard") ReviewBoardService rbUpdateBoard) {
		this.rbUpdateBoard = rbUpdateBoard;
	}
	
	@Autowired
	public void setRbDownload(@Qualifier("rbDownload") ReviewBoardService rbDownload) {
		this.rbDownload = rbDownload;
	}
	
	@Autowired
	public void setRbDelete(@Qualifier("rbDelete") ReviewBoardService rbDelete) {
		this.rbDelete = rbDelete;
	}
	
	@Autowired
	public void setRbRecommendationCount(@Qualifier("rbRecommendationCount") ReviewBoardService rbRecommendationCount) {
		this.rbRecommendationCount = rbRecommendationCount;
	}
	
	@Autowired
	public void setRbInsertRecommendationCount(@Qualifier("rbInsertRecommendationCount") ReviewBoardService rbInsertRecommendationCount) {
		this.rbInsertRecommendationCount = rbInsertRecommendationCount;
	}
	
	@Autowired
	public void setRbUpdateRecommendationCount(@Qualifier("rbUpdateRecommendationCount") ReviewBoardService rbUpdateRecommendationCount) {
		this.rbUpdateRecommendationCount = rbUpdateRecommendationCount;
	}
	
	@Autowired
	public void setRbUpdateNotRecommendationCount(@Qualifier("rbUpdateNotRecommendationCount") ReviewBoardService rbUpdateNotRecommendationCount) {
		this.rbUpdateNotRecommendationCount = rbUpdateNotRecommendationCount;
	}
	
	@Autowired
	public void setRbSelectReplyList(@Qualifier("rbSelectReplyList") ReviewBoardReplyService rbSelectReplyList) {
		this.rbSelectReplyList = rbSelectReplyList;
	}
	
	@Autowired
	public void setRbSelectReplyCount(@Qualifier("rbSelectReplyCount") ReviewBoardReplyService rbSelectReplyCount) {
		this.rbSelectReplyCount = rbSelectReplyCount;
	}
	
	@Autowired
	public void setRbInsertReplyBoard(@Qualifier("rbInsertReplyBoard") ReviewBoardReplyService rbInsertReplyBoard) {
		this.rbInsertReplyBoard = rbInsertReplyBoard;
	}
	
	@Autowired
	public void setRbUpdateReplyCount(@Qualifier("rbUpdateReplyCount") ReviewBoardReplyService rbUpdateReplyCount) {
		this.rbUpdateReplyCount = rbUpdateReplyCount;
	}
	
	@Autowired
	public void setRbUpdateBoardReply(@Qualifier("rbUpdateBoardReply") ReviewBoardReplyService rbUpdateBoardReply) {
		this.rbUpdateBoardReply = rbUpdateBoardReply;
	}
	
	@Autowired
	public void setRbDeleteReply(@Qualifier("rbDeleteReply") ReviewBoardReplyService rbDeleteReply) {
		this.rbDeleteReply = rbDeleteReply;
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

		List<ReviewBoardVo> boardList = rbSelectList.selectList(map);//게시물 목록
		model.addAttribute("boardList",boardList);
		
		int totalRows = rbSelectCount.selectCount(map);//게시물 수
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
		
		return "review_board/list";
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

		List<ReviewBoardVo> boardList = rbSelectList.selectList(map);//게시물 목록
		model.addAttribute("boardList",boardList);
		
		int totalRows = rbSelectCount.selectCount(map);//게시물 수
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
		
		return "review_board/list20";
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

		List<ReviewBoardVo> boardList = rbSelectList.selectList(map);//게시물 목록
		model.addAttribute("boardList",boardList);
		
		int totalRows = rbSelectCount.selectCount(map);//게시물 수
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
		
		return "review_board/list30";
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
		
		rbUpdateReadCount.updateReadCount(board_idx); //조회수증가
		ReviewBoardVo vo = rbSelectView.selectView(board_idx); //게시물 가져오기
					
		model.addAttribute("reviewBoardVo", vo);
		
		List<ReviewBoardReplyVo> boardReplyList = rbSelectReplyList.selectReplyList(board_idx);//댓글 목록
		int totalRows = rbSelectReplyCount.selectReplyCount(board_idx); //댓글 수
		
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
		
		return "review_board/view";
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
		
		return "review_board/write";
	}
	
	@PostMapping("/write_process.do")
	public String write_process(@RequestParam("attachedFile") MultipartFile attachedFile,
			String member_nickname, String member_idx, String title, String content,
			HttpServletRequest request) {
		String viewPage = "review_board/write"; // 글등록 실패시 보여지는 페이지
		
		//첨부파일과 함께 글내용 저장을 BoardFileInsertService클래스 이용
		int result = rbInsertBoard.insertBoard(attachedFile, member_nickname, member_idx, title, content, request);
		
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}

		List<ReviewBoardVo> boardList = rbSelectList.selectList(map);//게시물 목록
		int board_idx = boardList.get(0).getBoard_idx();
		
		if(result == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:../review_board/view.do?no="+board_idx;
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
		ReviewBoardVo vo = rbSelectView.selectView(board_idx);
		model.addAttribute("reviewboardVo", vo);
		
		return "review_board/edit";
	}
	
	@PostMapping("/edit_process.do")
	public String edit_process(@RequestParam("attachedFile") MultipartFile attachedFile,
			int board_idx, String title, String content,
			HttpServletRequest request, Model model) {
		String viewPage = "review_board/edit"; // 글수정 실패시 보여지는 페이지
		
		//첨부파일과 함께 글내용 수정을 BoardFileUpdateService클래스 이용
		int result = rbUpdateBoard.updateBoard(attachedFile, board_idx, title, content, request);
		
		if(result == 1) {//글수정 성공시 보여지는 페이지
			ReviewBoardVo vo = rbSelectView.selectView(board_idx);
			model.addAttribute("reviewBoardVo", vo);
			
			List<ReviewBoardReplyVo> boardReplyList = rbSelectReplyList.selectReplyList(board_idx);//댓글 목록
			int totalRows = rbSelectReplyCount.selectReplyCount(board_idx); //댓글 수
			
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
			
			viewPage = "review_board/view";
		}
		return viewPage;
	}
	
	@GetMapping("/download.do")
	public void download(String oName, String sName,
			HttpServletRequest request, HttpServletResponse response) {
		//request객체는 파일의 실제 저장경로를 알아내는데 필요하고,
		//response객체는 파일을 출력하는데 필요함
		
		//파일 다운로드 요청 처리는 BoardFileDownService 클래스 이용
		rbDownload.download(oName, sName, request, response);
	}
	
	@PostMapping("/delete_process.do")
	public String delete_process(@RequestParam("no") int board_idx, 
			HttpServletRequest request) {
		
		int result = rbDelete.deletePost(board_idx, request);
		
		String viewPage = "review_board/view";
		
		if(result == 1) {
			viewPage = "redirect:/review_board/list.do";
			
		}
		
		return viewPage;
	}
	
	@PostMapping("/rd_up_process.do")
	@ResponseBody
	public Object rd_up_process(@RequestParam("no") int board_idx, 
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();	
		
		int count = rbRecommendationCount.recommendationCount(board_idx, request);
		
		if(count == 0) {
			int temp = rbInsertRecommendationCount.insertRecommendationCount(board_idx, request);
			
			if(temp == 1) {
				rbUpdateRecommendationCount.updateRecommendationCount(board_idx);	
				ReviewBoardVo vo = rbSelectView.selectView(board_idx);
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
		
		int count = rbRecommendationCount.recommendationCount(board_idx, request);
		
		if(count == 0) {
			int temp = rbInsertRecommendationCount.insertRecommendationCount(board_idx, request);
			
			if(temp == 1) {
				rbUpdateNotRecommendationCount.updateNotRecommendationCount(board_idx);	
				ReviewBoardVo vo = rbSelectView.selectView(board_idx);
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
		String viewPage = "review_board/view";
		
		//첨부파일과 함께 글내용 저장을 BoardFileInsertService클래스 이용
		int result = rbInsertReplyBoard.insertReplyBoard(board_idx, member_nickname, member_idx, content);
		rbUpdateReplyCount.updateReplyCount(Integer.parseInt(board_idx));
				
		if(result == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:../review_board/view.do?no="+board_idx;
		}
		return viewPage;
	}
	
	@PostMapping("/reply_edit_process.do")
	public String reply_edit_process(String board_idx, String reply_idx, String content) {
		String viewPage = "review_board/view";
		
		//첨부파일과 함께 글내용 저장을 BoardFileInsertService클래스 이용
		int result = rbUpdateBoardReply.updateBoardReply(Integer.parseInt(reply_idx), content);
				
		if(result == 1) {//글등록 성공시 보여지는 페이지
			viewPage = "redirect:../review_board/view.do?no="+board_idx;
		}
		return viewPage;
	}
	
	@PostMapping("/reply_delete_process.do")
	public String reply_delete_process(String board_idx, String reply_idx, 
			HttpServletRequest request) {
		
		String viewPage = "review_board/view";
		int result = rbDeleteReply.deleteReply(Integer.parseInt(reply_idx), request);
		
		if(result == 1) {//글등록 성공시 보여지는 페이지
			rbUpdateReplyCount.updateReplyCount(Integer.parseInt(board_idx));
			viewPage = "redirect:../review_board/view.do?no="+board_idx;
		}
		
		return viewPage;
	}
	
}
