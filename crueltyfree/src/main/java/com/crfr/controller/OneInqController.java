package com.crfr.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.crfr.service.oneInq.OneInqService;
import com.crfr.vo.MemberVo;
import com.crfr.vo.NoticeVo;
import com.crfr.vo.OneInqVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ProductInqVo;

import lombok.Setter;

@Controller
@RequestMapping("/one_inq")
public class OneInqController {
	//서비스 클래스로 사용할 클래스들을 멤버변수로 정의하고 의존 자동 주입받도록 함
	@Setter(onMethod_={ @Autowired })
	OneInqService nInsertNotice, mListNotice, 
	cNoticeCount, noticePage, noticePage2, viewNotice, UpdateNotice, delNotice,oInsertOneinq;
	
	@Setter(onMethod_={ @Autowired })
	PageNav pageNav;
	
	@Setter(onMethod_={ @Autowired })
	PageNav pageNav2;
	
	@GetMapping("/notice.do")
	public String notice (NoticeVo vo, String pageNum, String pageBlock, Model model) {
		
		List<NoticeVo> noticeList = mListNotice.noticeList();
		model.addAttribute("noticeList", noticeList);
		
		int searchTotal = cNoticeCount.noticeListCount();
		pageNav.setTotalRows(searchTotal);
		pageNav = noticePage.setPageNav(pageNav, pageNum, pageBlock, vo);
		model.addAttribute("pageNav", pageNav);
		
		return "one_inq/notice";
	}
	
	//공지사항 작성 화면
	@GetMapping("/notice_write.do")
	public String notice_write() {		
		return "one_inq/notice_write";
	}
	
	//공지사항 작성하기 요청처리
	@PostMapping("/notice_process.do")
	public String notice_process(@RequestParam("attachedFile") MultipartFile attachedFile,
			String notice_title, String notice_content, HttpServletRequest request) {
		
		String viewPage = "one_inq/notice_write"; //글등록 실패시 보여지는 페이지
		
		//작성 내용 저장
		System.out.println("여기까진 성공");
		System.out.println("알림 내용:" + notice_content);
		int result = nInsertNotice.insertNotice(attachedFile, notice_title, notice_content, request);
		System.out.println("여기서 실패");
		
		if(result == 1) { // 글 등록 성공시 보여지는 페이지
			viewPage = "redirect:/one_inq/notice.do";
		}
		
		return viewPage;
	}
	
	
	//공지사항 뷰페이지보기
	@GetMapping("/notice_view.do")
	public String view(@RequestParam("prdNum") int notice_idx, Model model, HttpServletRequest request) {
			
		
		HttpSession session = request.getSession();		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");
		model.addAttribute("mVo", mVo);
		
		//게시물 가져오기 - BoardFileViewService 클래스 이용
		NoticeVo vo = viewNotice.noticeView(notice_idx);
		System.out.println("여기가 실행이되나?"+vo.getNotice_content());
		System.out.println(vo.getNotice_title());
		System.out.println(vo.getNotice_idx());
		model.addAttribute("noticeView", vo);
		
		return "one_inq/notice_view";
	}
	
	
	
	//해당 공지사항 수정 화면
	@GetMapping("/noticeModify.do")
	public String updatenotice(@RequestParam("prdNum")int notice_idx, Model model) {
		NoticeVo vo = viewNotice.noticeView(notice_idx);
		model.addAttribute("noticeView", vo);
		return "one_inq/notice_modify";			
	}
	
	
	
	//해당 공지사항 수정 요청 처리
	@PostMapping("/noticeModify_process.do")
	public String updatenotice_process(@RequestParam("attachedFile") MultipartFile attachedFile, NoticeVo vo, HttpServletRequest request) {
		int result = UpdateNotice.updatenotice(attachedFile,vo,request);
		System.out.println("attachedFile: "+attachedFile);
		System.out.println("노티스idx"+vo.getNotice_idx());
		System.out.println("result결과는?"+ result);
		String viewPage = "boast/view";
		if(result==1) {//글삭제 성공시
			viewPage = "redirect:/one_inq/notice.do?";
		}
		return viewPage;			
	}

	//해당 공지사항 삭제 요청 처리
	@GetMapping("/noticedel_process.do")
	public String deleteNotice(@RequestParam("prdNum")int notice_idx) {
		int result = delNotice.deletenotice(notice_idx);

		String viewPage = "boast/view";
		if(result==1) {//글삭제 성공시
			viewPage = "redirect:/one_inq/notice.do?";
		}
		return viewPage;			
	}
	
	
	//1:1문의 리스트 페이지
	@GetMapping("/one_inq_list.do")
	public String one_inq_list(OneInqVo vo, String pageNum, String pageBlock, Model model) {		
		
		List<OneInqVo> oneinqList = mListNotice.oneinqList();
		model.addAttribute("oneinqList", oneinqList);
		
		int searchTotal = cNoticeCount.oneinqListCount();
		pageNav2.setTotalRows(searchTotal);
		pageNav2 = noticePage2.setPageNav2(pageNav, pageNum, pageBlock, vo);
		model.addAttribute("pageNav", pageNav2);		
		return "one_inq/one_inq_list";
	}
	
	//1:1문의 작성하기 페이지
	@GetMapping("/one_inq_write.do")
	public String one_inq_write() {		
		return "one_inq/one_inq_write";
	}
	
	
	//1:1문의 작성하기 요청처리
	@PostMapping("/oneinq_process.do")
	public String oneinq_process(@RequestParam("attachedFile") MultipartFile attachedFile,
			OneInqVo vo , HttpServletRequest request) {
		
		HttpSession session = request.getSession();		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");
		String member_nickname = mVo.getMember_nickname();
		int member_idx = mVo.getMember_idx();
		vo.setMember_nickname(member_nickname);
		vo.setMember_idx(member_idx);
		
		int result1 = oInsertOneinq.insertOneinq(vo);
		
		
		int selectOneinq_idx = oInsertOneinq.selectOneinq_idx(vo);
		
		System.out.println("Oneinq_idx:"+ selectOneinq_idx);		
		System.out.println(vo.getOne_inq_title());
		
		int result2 = oInsertOneinq.insertOneinqimg(attachedFile, selectOneinq_idx, request);
		String viewPage = "one_inq/notice_write"; //글등록 실패시 보여지는 페이지

		
		
		
		
		if(result1 == 1 && result2==1) { // 글 등록 성공시 보여지는 페이지
			viewPage = "redirect:/one_inq/one_inq_list.do";
		}
		
		return viewPage;
	}
	
	
	//1:1문의 삭제 요청 처리
	@PostMapping("/one_inqdel_process.do")
	public String deleteinq(OneInqVo vo, HttpServletRequest request) {
		//request객체는 세션에 저장된 회원번호를 알아내기 위해 필요함
		HttpSession session = request.getSession();
		MemberVo mVo = (MemberVo)session.getAttribute("member");		
		int member_idx = mVo.getMember_idx();	
		vo.setMember_idx(member_idx);
		System.out.println("Member번호뭐냐"+vo.getMember_idx());
		System.out.println("문의번호:"+vo.getOne_inq_idx());
		
		int result=delNotice.deleteoneinq(vo);		
		String viewPage = "boast/view";
		if(result==1) {//글삭제 성공시
			viewPage = "redirect:/one_inq/one_inq_list.do?";
		}
		return viewPage;			
	}
					
	
	
	//1:1문의 수정 요청 처리
	@PostMapping("/one_inqModify_process.do")
	public String oneinqModify(OneInqVo vo, HttpServletRequest request) {
		HttpSession session = request.getSession();		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");		
		int member_idx = mVo.getMember_idx();		
		vo.setMember_idx(member_idx);
	
		int result = UpdateNotice.updateoneinq(vo);			
				
		String viewPage = "boast/view";
		if(result==1) {//글삭제 성공시
			viewPage = "redirect:/one_inq/one_inq_list.do";
		}
		return viewPage;			
	}
	
	
	
	
	
	
	
	
	
	
}
