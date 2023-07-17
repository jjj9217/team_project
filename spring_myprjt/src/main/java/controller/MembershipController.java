package controller;

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

import service.all_board.AllBoardService;
import service.membership.MembershipService;
import vo.AllBoardReplyVo;
import vo.AllBoardVo;
import vo.MembershipVo;

@Controller
@RequestMapping("/membership")
public class MembershipController {
	
	MembershipService mCheckId, mCheckNickname, mJoin, mLogin, mMy_info_edit, mMy_pw_edit, mDrop_out,
					mSearchId, mSearchPw, mSearch_pw_edit, mSelectMember, mSelectList, 
					mSelectView, mAdmin_member_edit, mAdmin_drop_out;
	AllBoardService abSelectMycontentList, abSelectMycontentCount, 
					abSelectMyreplyList, abSelectMyreplyCount,
					abSelectList, abSelectCount, abSelectReplyList, abSelectReplyCount, 
					abSelectView, abDelete, abDeleteReply, abUpdateReplyCount, abSelectReplyView;
	
	@Autowired
	public void setMCheckId(@Qualifier("mCheckId") MembershipService mCheckId) {
		this.mCheckId = mCheckId;
	}
	
	@Autowired
	public void setMCheckNickname(@Qualifier("mCheckNickname") MembershipService mCheckNickname) {
		this.mCheckNickname = mCheckNickname;
	}
	
	@Autowired
	public void setMJoin(@Qualifier("mJoin") MembershipService mJoin) {
		this.mJoin = mJoin;
	}
	
	@Autowired
	public void setMLogin(@Qualifier("mLogin") MembershipService mLogin) {
		this.mLogin = mLogin;
	}
	
	@Autowired
	public void setMMy_info_edit(@Qualifier("mMy_info_edit") MembershipService mMy_info_edit) {
		this.mMy_info_edit = mMy_info_edit;
	}
	
	@Autowired
	public void setMMy_pw_edit(@Qualifier("mMy_pw_edit") MembershipService mMy_pw_edit) {
		this.mMy_pw_edit = mMy_pw_edit;
	}
	
	@Autowired
	public void setMDrop_out(@Qualifier("mDrop_out") MembershipService mDrop_out) {
		this.mDrop_out = mDrop_out;
	}
	
	@Autowired
	public void setMSearchId(@Qualifier("mSearchId") MembershipService mSearchId) {
		this.mSearchId = mSearchId;
	}
	
	@Autowired
	public void setMSearchPw(@Qualifier("mSearchPw") MembershipService mSearchPw) {
		this.mSearchPw = mSearchPw;
	}
	
	@Autowired
	public void setMSearch_pw_edit(@Qualifier("mSearch_pw_edit") MembershipService mSearch_pw_edit) {
		this.mSearch_pw_edit = mSearch_pw_edit;
	}
	
	@Autowired
	public void setMSelectMember(@Qualifier("mSelectMember") MembershipService mSelectMember) {
		this.mSelectMember = mSelectMember;
	}
	
	@Autowired
	public void setMSelectList(@Qualifier("mSelectList") MembershipService mSelectList) {
		this.mSelectList = mSelectList;
	}
	
	@Autowired
	public void setMSelectView(@Qualifier("mSelectView") MembershipService mSelectView) {
		this.mSelectView = mSelectView;
	}
	
	@Autowired
	public void setMAdmin_member_edit(@Qualifier("mAdmin_member_edit") MembershipService mAdmin_member_edit) {
		this.mAdmin_member_edit = mAdmin_member_edit;
	}
	
	@Autowired
	public void setMAdmin_drop_out(@Qualifier("mAdmin_drop_out") MembershipService mAdmin_drop_out) {
		this.mAdmin_drop_out = mAdmin_drop_out;
	}
	
	@Autowired
	public void setAbSelectMycontentList(@Qualifier("abSelectMycontentList") AllBoardService abSelectMycontentList) {
		this.abSelectMycontentList = abSelectMycontentList;
	}
	
	@Autowired
	public void setAbSelectMycontentCount(@Qualifier("abSelectMycontentCount") AllBoardService abSelectMycontentCount) {
		this.abSelectMycontentCount = abSelectMycontentCount;
	}
	
	@Autowired
	public void setAbSelectMyreplyList(@Qualifier("abSelectMyreplyList") AllBoardService abSelectMyreplyList) {
		this.abSelectMyreplyList = abSelectMyreplyList;
	}
	
	@Autowired
	public void setAbSelectMyreplyCount(@Qualifier("abSelectMyreplyCount") AllBoardService abSelectMyreplyCount) {
		this.abSelectMyreplyCount = abSelectMyreplyCount;
	}
	
	@Autowired
	public void setAbelectList(@Qualifier("abSelectList") AllBoardService abSelectList) {
		this.abSelectList = abSelectList;
	}
	
	@Autowired
	public void setAbSelectCount(@Qualifier("abSelectCount") AllBoardService abSelectCount) {
		this.abSelectCount = abSelectCount;
	}
	
	@Autowired
	public void setAbSelectReplyList(@Qualifier("abSelectReplyList") AllBoardService abSelectReplyList) {
		this.abSelectReplyList = abSelectReplyList;
	}
	
	@Autowired
	public void setAbSelectReplyCount(@Qualifier("abSelectReplyCount") AllBoardService abSelectReplyCount) {
		this.abSelectReplyCount = abSelectReplyCount;
	}
	
	@Autowired
	public void setAbSelectView(@Qualifier("abSelectView") AllBoardService abSelectView) {
		this.abSelectView = abSelectView;
	}
	
	@Autowired
	public void setAbDelete(@Qualifier("abDelete") AllBoardService abDelete) {
		this.abDelete = abDelete;
	}
	
	@Autowired
	public void setAbDeleteReply(@Qualifier("abDeleteReply") AllBoardService abDeleteReply) {
		this.abDeleteReply = abDeleteReply;
	}
	
	@Autowired
	public void setAbUpdateReplyCount(@Qualifier("abUpdateReplyCount") AllBoardService abUpdateReplyCount) {
		this.abUpdateReplyCount = abUpdateReplyCount;
	}
	
	@Autowired
	public void setAbSelectReplyView(@Qualifier("abSelectReplyView") AllBoardService abSelectReplyView) {
		this.abSelectReplyView = abSelectReplyView;
	}
	
	@GetMapping("/join.do")
	public String join() {
		return "membership/join";
	}
	
	@PostMapping("/join_process.do")
	public String join_process(MembershipVo membershipVo, Model model, HttpServletRequest request) {
	//커맨드 객체: 폼의 입력값 전송을 처리하는 메소드에서 파라미터 값들을 저장하는데 사용되는 자바 객체
	//-파라미터 값들을 전달받을 수 있도록 setter메소드를 포함하고 있음
	//-폼의 name 속성값과 일치하는 필드에 입력값을 저장함
	//-뷰에서 커맨드 객체를 사용하려면 첫글자를 소문자로 바꾼 클래스 이름으로 사용할 수 있음
		
		int result = mJoin.join(membershipVo);
		
		String viewPage = "membership/join";
		HttpSession session = request.getSession();
		if(result == 1) {//정상적으로 회원가입이 이루어진 경우
			session.setAttribute("msg_join","ok");	
			viewPage = "redirect:/membership/login.do";
			//view이름으로 "redirect:요청정보"가 전달되면 요청정보로 재요청이 이루어짐
		}		
		return viewPage;
	}
		
	@PostMapping("/checkId_process.do")
	@ResponseBody
	public String checkId_process(@RequestParam("member_id") String member_id) {
		int result = mCheckId.checkId(member_id);
		String msg = null;
		if(result == -1) {
			msg = "success";
		}else {
			msg = "fail";
		}		
		return msg;
	}
	
	@PostMapping("/checkNickname_process.do")
	@ResponseBody
	public String checkNickname_process(@RequestParam("member_nickname") String member_nickname) {
		int result = mCheckNickname.checkNickname(member_nickname);
		String msg = null;
		if(result == -1) {
			msg = "success";
		}else {
			msg = "fail";
		}		
		return msg;
	}
	
	@GetMapping("/login.do")
	public String login() {
		return "membership/login";
	}
	
	@PostMapping("/login_process.do")
	public String login_process(String member_id, String member_pw,
			HttpServletRequest request, Model model) {
		
		//로그인 처리를 할 MemberLoginService클래스를 이용함
		MembershipVo vo = mLogin.login(member_id, member_pw);
		
		String viewPage = "membership/login";
		
		if(vo != null){//로그인 성공시
			//세션객체에 회원 정보를 추가함(추후 사용을 위해 회원정보를 MemberVo객체로 저장함)
			HttpSession session = request.getSession();
			session.setAttribute("membership", vo);
			
			String previousPage = request.getHeader("Referer");
		    session.setAttribute("previousPage", previousPage);
		    boolean containsMembership = previousPage.contains("membership");	
		    
		    if(previousPage != null) {
		    	if(containsMembership) {
		    		viewPage = "redirect:/main/home.do";
		    	}else {
		    		viewPage = "redirect:" + previousPage;		    		
		    	}
		    }else {
		    	viewPage = "redirect:/main/home.do";
		    }
		    
			
		}else{//로그인 실패시
			model.addAttribute("msg","fail");			
		}
		
		return viewPage;
	}
	
	//로그아웃 처리
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		
		String viewPage = null;
		String previousPage = request.getHeader("Referer");
	    session.setAttribute("previousPage", previousPage);
	    boolean containsMembership = previousPage.contains("membership");	  
	    
    	if(containsMembership) {
    		viewPage = "redirect:/main/home.do";
	    	session.invalidate();
    	}else {
    		viewPage = "redirect:" + previousPage;
    		session.invalidate();
    	}
    	
		return viewPage;
		
	}
	
	@GetMapping("/search_id.do")
	public String search_id() {
		return "membership/search_id";
	}
	
	@PostMapping("/search_id_process.do")
	public String search_id_process(HttpServletRequest request, 
			String member_name, String birthday, String email) {
		
		MembershipVo vo = mSearchId.searchId(member_name, birthday, email);
		HttpSession session = request.getSession();
		if(vo != null){
			session.setAttribute("search_id", vo);
			session.setAttribute("msg_searchId","ok");				
		}else{
			session.setAttribute("msg_searchId","fail");			
		}		
		return "redirect:/membership/search_id_result.do";
	}
	
	@GetMapping("/search_id_result.do")
	public String search_id_result() {
		return "membership/search_id_result";
	}
	
	@GetMapping("/search_pw.do")
	public String search_pw() {
		return "membership/search_pw";
	}
	
	@PostMapping("/search_pw_process.do")
	public String search_pw_process(HttpServletRequest request, 
			String member_id, String member_name, String birthday, String email) {
		
		MembershipVo vo = mSearchPw.searchPw(member_id, member_name, birthday, email);
		HttpSession session = request.getSession();
		if(vo != null){
			session.setAttribute("search_pw", vo);
			session.setAttribute("msg_searchPw","ok");				
		}else{
			session.setAttribute("msg_searchPw","fail");			
		}		
		return "redirect:/membership/search_pw_result.do";
	}
	
	@GetMapping("/search_pw_result.do")
	public String search_pw_result() {
		return "membership/search_pw_result";
	}
	
	@PostMapping("/search_pw_change_process.do")
	public String search_pw_change_process(MembershipVo membershipVo, HttpServletRequest request) {
		
		MembershipVo vo = mSearch_pw_edit.search_pw_edit(membershipVo);
		String viewPage = "redirect:/membership/search_pw.do";
		if(vo != null) {
			HttpSession session = request.getSession();
			session.removeAttribute("search_pw");
			session.setAttribute("msg_search_pw_change", "ok");
			viewPage = "redirect:/membership/login.do";
		}
		
		return viewPage;
	}
	
	@GetMapping("/mypage.do")
	public String mypage() {
		return "membership/mypage";
	}
	
	@GetMapping("/my_info_edit.do")
	public String my_info_edit() {
		return "membership/my_info_edit";
	}
	
	//회원정보 수정 처리
	@PostMapping("/my_info_edit_process.do")
	public String my_info_edit_process(MembershipVo membershipVo, HttpServletRequest request) {
		
		MembershipVo vo = mMy_info_edit.info_edit(membershipVo);
		String viewPage = "main/home";
		if(vo != null){//회원정보 수정 성공시
			HttpSession session = request.getSession();
			session.removeAttribute("membership");
			session.setAttribute("membership", vo);
			viewPage = "redirect:/membership/mypage.do";
		}
		
		return viewPage;
	}
	
	@GetMapping("/my_pw_edit.do")
	public String my_pw_edit() {
		return "membership/my_pw_edit";
	}
	
	//회원비밀번호 수정 처리
	@PostMapping("/my_pw_edit_process.do")
	public String my_pw_edit_process(MembershipVo membershipVo, HttpServletRequest request) {

		MembershipVo vo = mMy_pw_edit.pw_edit(membershipVo);
		String viewPage = "main/home";
		if(vo != null){//회원정보 수정 성공시
			HttpSession session = request.getSession();
			session.removeAttribute("membership");
			session.setAttribute("membership", vo);
			viewPage = "redirect:/membership/mypage.do";
		}
		
		return viewPage;
	}
	
	@GetMapping("/drop_out.do")
	public String drop_out() {
		return "membership/drop_out";
	}
	
	//회원탈퇴 요청 처리
	@PostMapping("/drop_out_process.do")
	public String drop_out_process(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MembershipVo vo = (MembershipVo)session.getAttribute("membership");
		int member_idx = vo.getMember_idx();
				
		int result = mDrop_out.drop_out(member_idx);
		
		String viewPage = "membership/mypage";
		
		if(result == 1){
			session.invalidate();
			viewPage = "redirect:/main/home.do";
			
		}		
		return viewPage;
	}
	
	@GetMapping("/admin_member.do")
	public String admin_member(HttpServletRequest request, Model model) {

		//사용자가 입력한 검색 조건을 Map에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}

		List<MembershipVo> memberList = mSelectList.selectList(map);//게시물 목록
		model.addAttribute("memberList",memberList);
		
		int totalRows = mSelectMember.selectMember(map);//게시물 수
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
		
		return "membership/admin_member";
	}
	
	@GetMapping("/admin_member_view.do")
	public String admin_member_view(HttpServletRequest request, Model model) {
		
		int member_idx = Integer.parseInt(request.getParameter("no"));  // 일련번호 받기 

		MembershipVo vo = mSelectView.selectView(member_idx);
		String birthday = vo.getBirthday();
		String[] parts = birthday.split("-");
		String year = parts[0];
		String month = parts[1];
		int monthInt = Integer.parseInt(month);
		String day = parts[2];
		
		HttpSession session = request.getSession();
		session.setAttribute("membershipVo", vo);
		
		model.addAttribute("membershipVo", vo);
		
		model.addAttribute("year",year);
		model.addAttribute("month",monthInt);
		model.addAttribute("day",day);
		
		return "membership/admin_member_view";
	}
	
	//관리자 회원정보 수정 처리
	@PostMapping("/admin_member_edit_process.do")
	public String admin_member_edit_process(MembershipVo membershipVo, HttpServletRequest request) {
		
		MembershipVo vo = mAdmin_member_edit.member_edit(membershipVo);
		String viewPage = "redirect:/membership/admin_member_view";
		if(vo != null){//회원정보 수정 성공시
			HttpSession session = request.getSession();
			session.removeAttribute("membershipVo");
			session.setAttribute("membershipVo", vo);
			viewPage = "redirect:/membership/admin_member.do";
		}
		
		return viewPage;
	}
	
	//회원탈퇴 요청 처리
	@PostMapping("/admin_drop_out_process.do")
	public String admin_drop_out_process(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MembershipVo vo = (MembershipVo)session.getAttribute("membershipVo");
		int member_idx = vo.getMember_idx();
		
		
		int result = mAdmin_drop_out.admin_drop_out(member_idx);
		
		String viewPage = "redirect:/membership/admin_member_view";
		
		if(result == 1){
			viewPage = "redirect:/membership/admin_member.do";			
		}		
		return viewPage;
	}
	
	//회원탈퇴 요청 처리
	@PostMapping("/admin_member_drop_out_process.do")
	public String admin_member_drop_out_process(HttpServletRequest request, Model model) {
		
		String[] selectedCheckboxes = request.getParameterValues("checkbox");
		
		int result = 0;
		
		for(int i = 0; i<selectedCheckboxes.length; i++) {
			int member_idx = Integer.parseInt(selectedCheckboxes[i]);
			MembershipVo vo = mSelectView.selectView(member_idx);
			model.addAttribute("membershipVo", vo);
					
			result = mAdmin_drop_out.admin_drop_out(member_idx);
		}
				
		
		String viewPage = "redirect:/main/home";
		
		if(result == 1){
			viewPage = "redirect:/membership/admin_member.do";			
		}		
		return viewPage;
	}
	
	@GetMapping("/mycontent.do")
	public String mycontent(HttpServletRequest request, Model model) {
		
		//사용자가 입력한 검색 조건을 Map에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		HttpSession session = request.getSession();
		MembershipVo mVo = (MembershipVo) session.getAttribute("membership");
		String memberNickname = mVo.getMember_nickname();
		
		if(searchWord != null){
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		if(memberNickname != null){
			  map.put("memberNickname", memberNickname);
		}
		
		List<AllBoardVo> contentList = abSelectMycontentList.selectMycontentList(map);//게시물 목록
		model.addAttribute("contentList", contentList);
		
		int totalRows = abSelectMycontentCount.selectMycontentCount(map);//게시물 수
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
		
		
		return "membership/mycontent";
	}
	
	@GetMapping("/myreply.do")
	public String myreply(HttpServletRequest request, Model model) {
		
		//사용자가 입력한 검색 조건을 Map에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		HttpSession session = request.getSession();
		MembershipVo mVo = (MembershipVo) session.getAttribute("membership");
		String memberNickname = mVo.getMember_nickname();
		
		if(searchWord != null){
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		if(memberNickname != null){
			  map.put("memberNickname", memberNickname);
		}
		
		List<AllBoardReplyVo> replyList = abSelectMyreplyList.selectMyreplyList(map);//게시물 목록		
		model.addAttribute("replyList", replyList);
		
		int totalRows = abSelectMyreplyCount.selectMyreplyCount(map);//게시물 수
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
		
		
		return "membership/myreply";
	}
	
	@GetMapping("/admin_content.do")
	public String admin_content(HttpServletRequest request, Model model) {
		
		//사용자가 입력한 검색 조건을 Map에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
				
		if(searchWord != null){
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
			
		List<AllBoardVo> boardList = abSelectList.selectList(map);;//게시물 목록
		model.addAttribute("boardList", boardList);
		
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
		
		
		return "membership/admin_content";
	}
	
	@GetMapping("/admin_reply.do")
	public String admin_reply(HttpServletRequest request, Model model) {
		
		//사용자가 입력한 검색 조건을 Map에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
				
		if(searchWord != null){
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
			
		List<AllBoardReplyVo> replyList = abSelectReplyList.selectReplyList(map);//게시물 목록
		model.addAttribute("replyList", replyList);
		
		int totalRows = abSelectReplyCount.selectReplyCount(map);//게시물 수
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
		
		
		return "membership/admin_reply";
	}
	
	
	@PostMapping("/admin_content_delete_process.do")
	public String admin_content_delete_process(HttpServletRequest request, Model model) {
		
		String[] selectedCheckboxes = request.getParameterValues("checkbox");
		
		int result = 0;
		
		for(int i = 0; i<selectedCheckboxes.length; i++) {
			int all_board_number = Integer.parseInt(selectedCheckboxes[i]);
			result = abDelete.deletePost(all_board_number, request);
		}
		
		
		
		String viewPage = "redirect:/main/home.do";
		
		
		if(result == 1){
			viewPage = "redirect:/membership/admin_content.do";			
		}		
		return viewPage;
	}
	
	@PostMapping("/admin_reply_delete_process.do")
	public String admin_reply_delete_process(HttpServletRequest request, Model model) {
		
		String[] selectedCheckboxes = request.getParameterValues("checkbox");
		
		int result = 0;
		
		for(int i = 0; i<selectedCheckboxes.length; i++) {
			int all_reply_number = Integer.parseInt(selectedCheckboxes[i]);
			AllBoardReplyVo vo = abSelectReplyView.selectReplyView(all_reply_number);
			result = abDeleteReply.deleteReply(all_reply_number, request);
			abUpdateReplyCount.updateReplyCount(vo.getBoard_idx());
		}
		
		String viewPage = "redirect:/main/home.do";
		
		
		if(result == 1){
			viewPage = "redirect:/membership/admin_reply.do";			
		}		
		return viewPage;
	}
	
}
