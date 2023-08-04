package com.crfr.controller;

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

import com.crfr.service.member.MemberService;
import com.crfr.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	MemberService mCheckId, mCheckNickName, mJoin, mLogin, mFindId, mFindPw, mFind_pw_edit;
	
	@Autowired
	public void setMCheckId(@Qualifier("mCheckId") MemberService mCheckId) {
		this.mCheckId = mCheckId;
	}
	@Autowired
	public void setMCheckNickName(@Qualifier("mCheckNickName") MemberService mCheckNickName) {
		this.mCheckNickName = mCheckNickName;
	}
	@Autowired
	public void setMJoin(@Qualifier("mJoin") MemberService mJoin) {
		this.mJoin = mJoin;
	}
	@Autowired
	public void setMLogin(@Qualifier("mLogin") MemberService mLogin) {
		this.mLogin = mLogin;
	}
	@Autowired
	public void setMFindId(@Qualifier("mFindId") MemberService mFindId) {
		this.mFindId = mFindId;
	}
	@Autowired
	public void setMFindPw(@Qualifier("mFindPw") MemberService mFindPw) {
		this.mFindPw = mFindPw;
	}
	@Autowired
	public void setMFind_pw_edit(@Qualifier("mFind_pw_edit") MemberService mFind_pw_edit) {
		this.mFind_pw_edit = mFind_pw_edit;
	}
	
	@GetMapping("/find_id.do")
	public String find_id() {		
		return "member/find_id";
	}
	
	@PostMapping("/find_id_process.do")
	public String find_id_process(HttpServletRequest request, 
			String member_name, String member_handphone) {
		
		MemberVo vo = mFindId.findId(member_name, member_handphone);
		HttpSession session = request.getSession();
		if(vo != null){
			session.setAttribute("find_id", vo);
			session.setAttribute("msg_findId","ok");	
		}else{
			session.setAttribute("msg_findId","fail");	
		}		
		return "redirect:/member/find_id_result.do";

	}
	
	@GetMapping("/find_id_result.do")
	public String find_id_result() {
		return "member/find_id_result";
	}
	
	
	@GetMapping("/find_pw.do")
	public String find_pw() {		
		return "member/find_pw";
	}
	
	@PostMapping("/find_pw_process.do")
	public String find_pw_process(HttpServletRequest request, 
			String member_id, String member_name, String member_handphone) {
		
		MemberVo vo = mFindPw.findPw(member_id, member_name, member_handphone);
		HttpSession session = request.getSession();
		if(vo != null){
			session.setAttribute("find_pw", vo);
			session.setAttribute("msg_findPw","ok");				
		}else{
			session.setAttribute("msg_findPw","fail");			
		}		
		return "redirect:/member/find_pw_result.do";
	}
	
	@GetMapping("/find_pw_result.do")
	public String find_pw_result() {		
		return "member/find_pw_result";
	}
	
	@PostMapping("/find_pw_edit_process.do")
	public String find_pw_edit_process(MemberVo memberVo, HttpServletRequest request) {
		
		MemberVo vo = mFind_pw_edit.find_pw_edit(memberVo);
		String viewPage = "redirect:/member/join.do";
		System.out.println(vo);
		if(vo != null) {
			HttpSession session = request.getSession();
			session.removeAttribute("find_pw");
			session.setAttribute("msg_find_pw_edit", "ok");
			viewPage = "redirect:/member/login.do";
		}
		return viewPage;
	}
	
	@GetMapping("/join.do")
	public String join() {		
		return "member/join";
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
		int result = mCheckNickName.checkNickName(member_nickname);
		String msg = null;
		if(result == -1) {
			msg = "success";
		}else {
			msg = "fail";
		}		
		return msg;
	}
	
	@PostMapping("/join_process.do")
	public String join_process(MemberVo memberVo, Model model, HttpServletRequest request) {
	//커맨드 객체: 폼의 입력값 전송을 처리하는 메소드에서 파라미터 값들을 저장하는데 사용되는 자바 객체
	//-파라미터 값들을 전달받을 수 있도록 setter메소드를 포함하고 있음
	//-폼의 name 속성값과 일치하는 필드에 입력값을 저장함
	//-뷰에서 커맨드 객체를 사용하려면 첫글자를 소문자로 바꾼 클래스 이름으로 사용할 수 있음
		
		int result = mJoin.join(memberVo);
		
		String viewPage = "member/join";
		HttpSession session = request.getSession();
		if(result == 1) {//정상적으로 회원가입이 이루어진 경우
			session.setAttribute("msg_join","ok");	
			viewPage = "redirect:/member/join_result.do";
			//view이름으로 "redirect:요청정보"가 전달되면 요청정보로 재요청이 이루어짐
		}		
		return viewPage;
	}
	
	@GetMapping("/join_result.do")
	public String join_result() {
		return "member/join_result";
	}
	
	@GetMapping("/login.do")
	public String login() {		
		return "member/login";
	}
	
	@PostMapping("/login_process.do")
	public String login_process(String member_id, String member_pw, 
			HttpServletRequest request, Model model) {
		
		//로그인 처리를 할 MemberLoginService클래스를 이용함
		MemberVo vo = mLogin.login(member_id, member_pw);
		String viewPage = "member/login";
		if(vo != null){//로그인 성공시
			//세션객체에 회원 정보를 추가함(추후 사용을 위해 회원정보를 MemberVo객체로 저장함)
			HttpSession session = request.getSession();
			session.setAttribute("member", vo);
			viewPage = "redirect:/main/home.do";
		}else{//로그인 실패시
			model.addAttribute("msg","fail");
			
		}
		return viewPage;
	}
	@GetMapping("/terms.do")
	public String terms() {		
		return "member/terms";
	}
	
	//로그아웃 처리
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();//세션 초기화
			
		return "redirect:/main/home.do";
	}
	
	
	
}
