package com.crfr.controller;

import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.crfr.service.mypage.MypageService;
import com.crfr.vo.CouponVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.LikeExploreVo;
import com.crfr.vo.MemberVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ReviewExploreVo;
import com.crfr.vo.ReviewVo;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	MypageService mpList, mpPage, mpCount, mpInsert, mpUpdate, mpDelete, mpView;
	PageNav pageNav;

	@Autowired
	public void setMpList(@Qualifier("mpList") MypageService mpList) {
		this.mpList = mpList;
	}

	@Autowired
	public void setMpPage(@Qualifier("mpPage") MypageService mpPage, PageNav pageNav) {
		this.mpPage = mpPage;
		this.pageNav = pageNav;
	}

	@Autowired
	public void setMpCount(@Qualifier("mpCount") MypageService mpCount) {
		this.mpCount = mpCount;
	}

	@Autowired
	public void setMpInsert(@Qualifier("mpInsert") MypageService mpInsert) {
		this.mpInsert = mpInsert;
	}

	@Autowired
	public void setMpUpdate(@Qualifier("mpUpdate") MypageService mpUpdate) {
		this.mpUpdate = mpUpdate;
	}
	
	@Autowired
	public void setMpDelete(@Qualifier("mpDelete") MypageService mpDelete) {
		this.mpDelete = mpDelete;
	}
	
	@Autowired
	public void setMpView(@Qualifier("mpView") MypageService mpView) {
		this.mpView = mpView;
	}
	
	//마이 페이지 메인으로 이동
	@GetMapping("/mypage_main.do")
	public String mypage_main() {
		return "mypage/mypage_main";
	}
	
	//리뷰페이지의 메인으로 이동
	@GetMapping("/mypage_nonreview.do")
	public String mypage_nonreview(HttpServletRequest request, String pageNum, String pageBlock, Model model) {
		
		HttpSession session = request.getSession();		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");
		int member_idx = mVo.getMember_idx();		
			
		// 내가 구매한 목록 중 리뷰를 작성하지 않은 사진목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<FileVo> nonreviewfileList = mpList.selectmynonreviewListimg(member_idx);
		model.addAttribute("nonreviewfileList", nonreviewfileList);

		// 내가 구매한 목록 중 리뷰를 작성하지 않은 목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<ReviewExploreVo> nonreviewproductList = mpList.selectmynonreviewList(member_idx);
		model.addAttribute("nonreviewproductList", nonreviewproductList);

		// 총 레코드 수를 가져오기 위해 MypageCountService클래스 이용
		int searchTotal = mpCount.selectmynonreviewCount(member_idx);

		// 총 레코드 수 대입
		pageNav.setTotalRows(searchTotal);
		// 페이지네비게이션을 위해 MypagePageService클래스를 이용
		pageNav = mpPage.setPageNav(pageNav, pageNum, pageBlock, member_idx);

		// html에서 사용하기 위해 세팅
		model.addAttribute("pageNav", pageNav);

		return "mypage/mypage_nonreview";
	}
	
	//리뷰페이지의 작성한 나의리뷰 페이지로 이동
	@GetMapping("/mypage_review.do")
	public String mypage_review(FileVo vo, HttpServletRequest request, String pageNum, String pageBlock, Model model) {
		
		HttpSession session = request.getSession();
		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");
		int member_idx = mVo.getMember_idx();
		vo.setMember_idx(member_idx);

		// 내가 구매한 목록 중 리뷰를 작성한 목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<ReviewExploreVo> reviewproductList = mpList.selectmyreviewList(member_idx);
		model.addAttribute("reviewproductList", reviewproductList);
		
		
		List<List<FileVo>> reviewRegList = new ArrayList<List<FileVo>>();
		for(ReviewExploreVo reVo : reviewproductList) {
			int review_idx = reVo.getReview_idx();
			vo.setReview_idx(review_idx);
			reviewRegList.add(mpList.reviewRegList(vo));
		}
		
		// 작성한 나의 리뷰에 등록한 사진 목록 가져오는 요청에 대한 처리
		//List<FileVo> reviewReg = mpList.reviewRegList(vo);		
		model.addAttribute("reviewRegList", reviewRegList);
		
		
		// 내가 구매한 목록 중 리뷰를 작성한 사진목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<FileVo> reviewfileList = mpList.selectmyreviewListimg(member_idx);
		model.addAttribute("reviewfileList", reviewfileList);
		
		// 총 레코드 수를 가져오기 위해 MypageCountService클래스 이용
		int searchTotal = mpCount.selectmyreviewCount(member_idx);

		// 총 레코드 수 대입
		pageNav.setTotalRows(searchTotal);
		// 페이지네비게이션을 위해 MypagePageService클래스를 이용
		pageNav = mpPage.setPageNav(pageNav, pageNum, pageBlock, member_idx);
		
		
		
		// html에서 사용하기 위해 세팅
		model.addAttribute("pageNav", pageNav);
		return "mypage/mypage_review";
	}

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//리뷰 작성, 나의 작성한 리뷰 보기	
	@PostMapping("/mypage_reviewReg_process.do")
	public String mypage_review_insert1(MultipartFile[] attachedFile, ReviewVo vo, HttpServletRequest request) {
		HttpSession session = request.getSession();		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");
		String member_nickname = mVo.getMember_nickname();
		int member_idx = mVo.getMember_idx();
		vo.setMember_nickname(member_nickname);
		vo.setMember_idx(member_idx);
		
		
		System.out.println("멤버번호:"+vo.getMember_idx());
		System.out.println("상품번호:"+vo.getProduct_idx());
		System.out.println("리뷰스코어:"+vo.getReview_score());
		System.out.println("리뷰내용:"+vo.getReview_content());
		System.out.println("멤버닉네임:"+vo.getMember_nickname());
		
		// 아래 내용이 성공적으로 이루어지지 않으면 실패페이지 주소 반환
		String viewpage = "mypage_review_err";
		
		// 리뷰내용 작성
		int insertreview = mpInsert.insertreview(vo);
		// 위를 통해 mysql의 review테이블에 내용에 관한 쿼리가 삽입되는데, 이 때 쿼리에서 autoincrement되어 생성된
		// review_idx값 조회하여 반환해야 한다
		// 그래야 사진을 삽입하는데 파일테이블에 삽입될 review_idx를 얻어올 수 있기 때문이다
		
		// review_idx값 조회
		int searchReview_idx = mpInsert.selectReview_idx(vo);
		System.out.println("생성된 review_idx번호:"+searchReview_idx);
		int insertreviewimg = 0;
		
		// 리뷰사진 작성 및 searchReview_idx에서 얻은값까지 같이 건네주기
		
//		for(int i = 0; i < attachedFile.length; i++) {
//		if(!attachedFile.isEmpty()) {
		insertreviewimg = mpInsert.insertreviewimg(attachedFile, request, searchReview_idx);
		System.out.println("insertreviewimg"+insertreviewimg);//}
//		else {
//			insertreviewimg =1;
//		}
//		}
		if(insertreviewimg != 1) {
			insertreviewimg = 1;
		}
		
		// 리뷰내용과 리뷰사진이 둘 다 제대로 sql에 삽입되었다면 맨 처음 나의리뷰페이지 주소값을 반환
		if (insertreview == 1 && insertreviewimg == 1) {
			viewpage = "redirect:/mypage/mypage_nonreview.do";
		}
		return viewpage;
	}

	@GetMapping("/test.do")
	public String mypage_test() {
		return "mypage/test";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	//나의 작성한리뷰 수정하기
	@PostMapping("/mypage_reviewModifyReg_process.do")
	public String mypage_review_modify(MultipartFile[] attachedFile, ReviewVo vo, HttpServletRequest request) {
		HttpSession session = request.getSession();		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");
		String member_nickname = mVo.getMember_nickname();
		int member_idx = mVo.getMember_idx();
		vo.setMember_nickname(member_nickname);
		vo.setMember_idx(member_idx);
		
		
		System.out.println("멤버번호:"+vo.getMember_idx());
		System.out.println("상품번호:"+vo.getProduct_idx());
		System.out.println("리뷰스코어:"+vo.getReview_score());
		System.out.println("리뷰내용:"+vo.getReview_content());
		System.out.println("멤버닉네임:"+vo.getMember_nickname());
		
		// 아래 내용이 성공적으로 이루어지지 않으면 실패페이지 주소 반환
		String viewpage = "mypage_review_err";
		
		// 리뷰내용 작성
		int insertreview = mpUpdate.updatereview(vo);
		// 위를 통해 mysql의 review테이블에 내용에 관한 쿼리가 삽입되는데, 이 때 쿼리에서 autoincrement되어 생성된
		// review_idx값 조회하여 반환해야 한다
		// 그래야 사진을 삽입하는데 파일테이블에 삽입될 review_idx를 얻어올 수 있기 때문이다
		
		// review_idx값 조회
//		int searchReview_idx = mpInsert.selectReview_idx(vo);
//		System.out.println("생성된 review_idx번호:"+searchReview_idx);
		int insertreviewimg = 0;
		
//		int searchReview_idx = vo.getFile_idx();
		// 리뷰사진 작성 및 searchReview_idx에서 얻은값까지 같이 건네주기
		System.out.println("파일번호idx:"+vo.getFile_idx());
//		for(int i = 0; i < attachedFile.length; i++) {
//		if(!attachedFile[i].isEmpty()) {
		
		
		
		
		List<ReviewVo> fileidx = mpList.reviewRegList2(vo);
		
		int i = 0;
		for(ReviewVo reVo: fileidx) {
					
			int searchReview_idx = reVo.getFile_idx();
			System.out.println("파일번호"+reVo.getFile_idx());
			if(i==0){
				
				insertreviewimg = mpUpdate.updatereviewimg0(attachedFile,request, searchReview_idx);
				System.out.println("insertreviewimg의 0번째 값"+insertreviewimg);
				System.out.println("0번째방 파일번호"+reVo.getFile_idx());
			}else if(i==1) {
				insertreviewimg = mpUpdate.updatereviewimg1(attachedFile,request, searchReview_idx);
				System.out.println("insertreviewimg의 1번째 값"+insertreviewimg);
				System.out.println("1번째방 파일번호"+reVo.getFile_idx());
			}else if(i==2) {
				insertreviewimg = mpUpdate.updatereviewimg2(attachedFile,request, searchReview_idx);
				System.out.println("insertreviewimg의 2번째 값"+insertreviewimg);
			}else if(i==3) {
				insertreviewimg = mpUpdate.updatereviewimg3(attachedFile,request, searchReview_idx);
				System.out.println("insertreviewimg의 3번째 값"+insertreviewimg);
			}else{
				insertreviewimg = mpUpdate.updatereviewimg4(attachedFile,request, searchReview_idx);
				System.out.println("insertreviewimg의 4번째 값"+insertreviewimg);
			}			
			i++;
		}
		
		
			
		if(insertreviewimg!=1){
			insertreviewimg =1;
		}
		
		// 리뷰내용과 리뷰사진이 둘 다 제대로 sql에 삽입되었다면 맨 처음 나의리뷰페이지 주소값을 반환
		if (insertreview == 1 && insertreviewimg == 1) {
			viewpage = "redirect:/mypage/mypage_review.do";
		}
		return viewpage;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//배송지/환불계좌 메인페이지로 이동
	
	@GetMapping("/mypage_deliverymain.do")
	public String mypage_deliverymain(HttpServletRequest request, String pageNum, String pageBlock, Model model) {
		
		HttpSession session = request.getSession();
		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");
		int member_idx = mVo.getMember_idx();
		
		// 나의 배송지목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<DeliveryVo> deliveryList = mpList.selectdeliveryList(member_idx);
		model.addAttribute("deliveryList", deliveryList);

		// 총 레코드 수를 가져오기 위해 MypageCountService클래스 이용
		int searchTotal = mpCount.selectdeliveryCount(member_idx);

		// 총 레코드 수 대입
		pageNav.setTotalRows(searchTotal);
		// 페이지네비게이션을 위해 MypagePageService클래스를 이용
		pageNav = mpPage.setPageNav(pageNav, pageNum, pageBlock, member_idx);

		// html에서 사용하기 위해 세팅
		model.addAttribute("pageNav", pageNav);

		return "mypage/mypage_deliverymain";
	}

	

	//배송지삭제 , 기본배송지수정 , 등록된 배송지내용 수정, 배송지등록
	
	//배송지삭제 요청 처리
	@PostMapping("/delete_process_comment.do")
	public String deletedeliveryPost(@RequestParam("no")int delivery_idx, DeliveryVo vo, HttpServletRequest request) {
		//request객체는 세션에 저장된 회원번호를 알아내기 위해 필요함
		
		System.out.println(delivery_idx);
		vo.setDelivery_idx(delivery_idx);
		System.out.println("delvery받았나?"+vo.getDelivery_idx());
		//System.out.println("DeliveryVo.member_idx"+vo.getMember_idx());
		//글삭제 요청 처리를 위해 BoardFileDeleteService 클래스 이용
		int result = mpDelete.deletedeliveryPost(vo);
		System.out.println("삭제됨?"+result);
		String viewPage = "boast/view";
		if(result==1) {//글삭제 성공시
			viewPage = "redirect:/mypage/mypage_deliverymain.do?";
		}
		return viewPage;			
	}
	
	
	//기본배송지수정 요청 처리
	@PostMapping("/delete_process_comment2.do")
	public String deletedeliveryPost2(@RequestParam("no")int delivery_idx, DeliveryVo vo, HttpServletRequest request) {
		//request객체는 세션에 저장된 회원번호를 알아내기 위해 필요함
		
		System.out.println(delivery_idx);
		vo.setDelivery_idx(delivery_idx);
		System.out.println("delvery받았나?"+vo.getDelivery_idx());
		//System.out.println("DeliveryVo.member_idx"+vo.getMember_idx());
		//글삭제 요청 처리를 위해 BoardFileDeleteService 클래스 이용
		
		int result2 = mpUpdate.updatedeliveryPostchangedefault(vo);
		int result = mpUpdate.updatedeliveryPostdefault(vo);			
		
		System.out.println("삭제됨?"+result);
		System.out.println("삭제됨2?"+result2);
		
		String viewPage = "boast/view";
		if(result==1) {//글삭제 성공시
			viewPage = "redirect:/mypage/mypage_deliverymain.do";
		}
		return viewPage;			
	}
	

	//수정할 배송지 페이지
	//수정할 배송지 페이지 보여주기
	@PostMapping("/edit_deliveryreg.do")
	public String SelectvieweditdeliveryPost(@RequestParam("no")int delivery_idx, Model model, HttpServletRequest request) {		
		DeliveryVo vo = mpView.selectVieweditdelivery(delivery_idx);
		model.addAttribute("DeliveryVo", vo);
		System.out.println("겟딜리버리아이디엑스:"+vo.getDelivery_idx());
		HttpSession session2 = request.getSession();
		session2.setAttribute("delivery", vo);
		return "mypage/mypage_deliveryreg_edit";
		
	}
	
	//배송지 수정
	@PostMapping("/edit_process_deliveryreg.do")
	public String mypage_edit_process_deliveryreg1(DeliveryVo vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		HttpSession session2 = request.getSession();
		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");
		int member_idx = mVo.getMember_idx();	
		vo.setMember_idx(member_idx);
		System.out.println("멤버번호:"+member_idx);

		
		DeliveryVo Dvo = (DeliveryVo)session2.getAttribute("delivery");
		int delivery_idx = Dvo.getDelivery_idx();
		vo.setDelivery_idx(delivery_idx);
		System.out.println("딜리버리아이디엑스제발:"+delivery_idx);
			
		// 아래 내용이 성공적으로 이루어지지 않으면 실패페이지 주소 반환
		String viewpage = "mypage_review_err";
		System.out.println("디폴트포스트숫자 :"+vo.getDefaultpost());
		
		System.out.println("delivery_idx:"+vo.getDelivery_idx());
		// 배송지 수정
		int insertreview=0;
		if(vo.getDefaultpost()==1) {					
			insertreview = mpUpdate.updatedeliveryPost(vo);
			System.out.println("여기가 실행되어야 한다");
			System.out.println("디폴트포스트가 1일 때 RESULT는?:"+insertreview);
			mpUpdate.updatedeliveryPostdefault(vo);			
			mpUpdate.updatedeliveryPostchangedefault(vo);					
		}else{			
			insertreview = mpUpdate.updatedeliveryPost(vo);
			System.out.println("0일 때는 여기가 실행되어야 한다");
			System.out.println("디폴트포스트가 0일 때 RESULT는?:"+insertreview);
		}
						
		// 배송지가 제대로 sql에 수정되었다면 맨 처음 나의배송지페이지 주소값을 반환
		if (insertreview == 1) {
			viewpage = "redirect:/mypage/mypage_deliverymain.do";
		}
		return viewpage;
	}
		
	
	//배송지등록	
	@GetMapping("/mypage_deliveryreg.do")
	public String mypage_test4() {
		return "mypage/mypage_deliveryreg";
	}
	
	@PostMapping("/mypage_deliveryreg_write_process.do")
	public String mypage_deliveryreg_insert1(DeliveryVo vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");
		int member_idx = mVo.getMember_idx();	
		vo.setMember_idx(member_idx);
		
		// 아래 내용이 성공적으로 이루어지지 않으면 실패페이지 주소 반환
		String viewpage = "mypage_review_err";
		// 배송지 등록
		int insertreview=0;
		System.out.println("배송지등록디폴트 기본설정시1인가?"+vo.getDefaultpost());
		if(vo.getDefaultpost()==1) {		
			mpUpdate.updatedeliveryPostchangedefault(vo);
			insertreview = mpInsert.insertdeliveryPost(vo);
		}else{
			insertreview = mpInsert.insertdeliveryPost_normal(vo);		
		}
		
		// 배송지가 제대로 sql에 삽입되었다면 맨 처음 나의배송지페이지 주소값을 반환
		if (insertreview == 1) {
			viewpage = "redirect:/mypage/mypage_deliverymain.do";
		}
		return viewpage;
	}
	
	
	
	
	
	
	
	
	
	
	
	//회원정보수정 메인	
	@GetMapping("/mypage_modifymain.do")
	public String mypage_test5() {
		return "mypage/mypage_modifymain";
	}
	
	
	//회원정보수정의 비밀번호수정페이지 이동 클릭	
	@GetMapping("/mypage_modify_password.do")
	public String mypage_test6(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");
		model.addAttribute("MemberVo", mVo);
		return "mypage/mypage_modify_password";
	}
		
	
	
	
	//비밀번호 수정
	@PostMapping("/mypage_modify_changepassword_process.do")
	public String mypage_modify_changepassword_process(String member_pw_change, MemberVo vo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");
		model.addAttribute("MemberVo", session);
		int member_idx = mVo.getMember_idx();	
		vo.setMember_idx(member_idx);		
		vo.setMember_pw(member_pw_change);
		
		int ok = mpUpdate.changepassword(vo);
		System.out.println("업데이트비밀번호:"+ok);
		// 아래 내용이 성공적으로 이루어지지 않으면 실패페이지 주소 반환
		String viewpage = "mypage_review_err";
					
		// 배송지가 제대로 sql에 수정되었다면 맨 처음 나의배송지페이지 주소값을 반환
		if (ok ==1) {			
			session.setAttribute("MemberVo", vo);
			viewpage = "redirect:/mypage/mypage_modifymain.do";
		}
		return viewpage;
	}
	
	
	
	
	
	//회원정보수정의 회원정보수정페이지 이동 클릭	
	@GetMapping("/mypage_modify_info.do")
	public String mypage_test7(HttpServletRequest request, Model model) {
				
		return "mypage/mypage_modify_info";
	}
	
	
	//회원정보 수정페이지로 이동
	@PostMapping("/mypage_modify_changeinfo.do")
	public String mypage_modify_changeinfo(MemberVo vo, HttpServletRequest request, Model model) {
		
		return "mypage/mypage_modify_changeinfo";
	}
	
	//회원정보 수정
	@PostMapping("/infoupdate_process.do")
	public String mypage_modify_changeinfo_process(MemberVo memberVo, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		//커맨드 객체: 폼의 입력값 전송을 처리하는 메소드에서 파라미터 값들을 저장하는데 사용되는 자바 객체
		
		//회원정보 수정을 처리할 MemberUpdateService클래스를 이용
		MemberVo vo = mpUpdate.updateMemberInfo(memberVo);
				
		if(vo != null){//회원정보 수정 성공시
			HttpSession session = request.getSession();
			session.removeAttribute("member");
			session.setAttribute("member", vo);
			redirectAttributes.addFlashAttribute("msgOk", "회원정보가 성공적으로 수정되었습니다.");
		}else {
			redirectAttributes.addFlashAttribute("msgFail", "회원정보 수정에 실패하였습니다.");
		}
		
		return "redirect:/mypage/mypage_modifymain.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//좋아요페이지로 이동
	@GetMapping("/mypage_like.do")
	public String mypage_like(HttpServletRequest request,String pageNum, String pageBlock, Model model) {
		HttpSession session = request.getSession();		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");		
		int member_idx = mVo.getMember_idx();		
		
		//좋아요 사진목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<FileVo> likefileList = mpList.selectlikeListimg(member_idx);
		model.addAttribute("likefileList", likefileList);

		//좋아요 목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<LikeExploreVo> likeproductList = mpList.selectlikeList(member_idx);
		model.addAttribute("likeproductList", likeproductList);

		// 총 레코드 수를 가져오기 위해 MypageCountService클래스 이용
		int searchTotal = mpCount.selectlikeListCount(member_idx);

		// 총 레코드 수 대입
		pageNav.setTotalRows(searchTotal);
		// 페이지네비게이션을 위해 MypagePageService클래스를 이용
		pageNav = mpPage.setPageNav(pageNav, pageNum, pageBlock, member_idx);

		// html에서 사용하기 위해 세팅
		model.addAttribute("pageNav", pageNav);
				
		return "mypage/mypage_like";
	}
	
	//좋아요삭제 요청 처리
	@PostMapping("/delete_process_like.do")
	public String deletedelike(@RequestParam("no")int like_idx, LikeExploreVo vo, HttpServletRequest request) {
		//request객체는 세션에 저장된 회원번호를 알아내기 위해 필요함
		HttpSession session = request.getSession();
		MemberVo mVo = (MemberVo)session.getAttribute("member");		
		int member_idx = mVo.getMember_idx();	
		vo.setMember_idx(member_idx);
		System.out.println("Member번호뭐냐"+vo.getMember_idx());
		System.out.println(like_idx);
		vo.setLike_idx(like_idx);		
		System.out.println("like받았나?"+vo.getLike_idx());
		//System.out.println("DeliveryVo.member_idx"+vo.getMember_idx());
		//글삭제 요청 처리를 위해 BoardFileDeleteService 클래스 이용
		
		int result=0; 
		if(vo.getLike_idx() != 0) {
			mpDelete.deletelike(vo);}
		else {mpDelete.deletelikeall(vo);}
		System.out.println("삭제됨?"+result);
		String viewPage = "boast/view";
		if(result==1) {//글삭제 성공시
			viewPage = "redirect:/mypage/mypage_like.do?";
		}
		return viewPage;			
	}
	
	//좋아요전체삭제 요청 처리
	@GetMapping("/delete_process_likeall.do")
	public String deletedelikeall(LikeExploreVo vo, HttpServletRequest request) {
		//request객체는 세션에 저장된 회원번호를 알아내기 위해 필요함
		HttpSession session = request.getSession();
		MemberVo mVo = (MemberVo)session.getAttribute("member");		
		int member_idx = mVo.getMember_idx();	
		vo.setMember_idx(member_idx);
		System.out.println("Member번호뭐냐"+vo.getMember_idx());		
		System.out.println("like받았나?"+vo.getLike_idx());
			//System.out.println("DeliveryVo.member_idx"+vo.getMember_idx());
			//글삭제 요청 처리를 위해 BoardFileDeleteService 클래스 이용
			
			int result=mpDelete.deletelikeall(vo);
			System.out.println("삭제됨?"+result);
			String viewPage = "boast/view";
			if(result!=0) {//글삭제 성공시
				viewPage = "redirect:/mypage/mypage_like.do?";
			}
			return viewPage;			
		}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//쿠폰페이지로 이동
	@GetMapping("/mypage_coupon.do")
	public String mypage_coupon(CouponVo vo, HttpServletRequest request, String pageNum, String pageBlock, Model model) {
		HttpSession session = request.getSession();		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");		
		int member_idx = mVo.getMember_idx();		
		vo.setMember_idx(member_idx);
						
		// 내가 구매한 목록 중 리뷰를 작성한 목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<CouponVo> couponList = mpList.selectcouponList(member_idx);
		model.addAttribute("couponList", couponList);
							
		// 총 레코드 수를 가져오기 위해 MypageCountService클래스 이용
		int searchTotal = mpCount.selectcouponListCount(member_idx);

		// 총 레코드 수 대입
		pageNav.setTotalRows(searchTotal);
		// 페이지네비게이션을 위해 MypagePageService클래스를 이용
		pageNav = mpPage.setPageNav(pageNav, pageNum, pageBlock, member_idx);
		
		// html에서 사용하기 위해 세팅
		model.addAttribute("pageNav", pageNav);
				
		return "mypage/mypage_coupon";
	}
	
	
	
	
	
	//상품QnA페이지로 이동
	@GetMapping("/mypage_productQnA.do")
	public String mypage_QnA(FileVo vo, HttpServletRequest request, String pageNum, String pageBlock, Model model) {
		HttpSession session = request.getSession();		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");		
		int member_idx = mVo.getMember_idx();		
		vo.setMember_idx(member_idx);
		
		// 내가 구매한 목록 중 리뷰를 작성한 사진목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<FileVo> inqfileList = mpList.selectproductinqListimg(member_idx);
		model.addAttribute("inqfileList", inqfileList);
		
		// 내가 구매한 목록 중 리뷰를 작성한 목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<ProductInqVo> inqproductList = mpList.selectproductinqList(member_idx);
		model.addAttribute("inqproductList", inqproductList);
							
		// 총 레코드 수를 가져오기 위해 MypageCountService클래스 이용
		int searchTotal = mpCount.selectproductinqCount(member_idx);

		// 총 레코드 수 대입
		pageNav.setTotalRows(searchTotal);
		// 페이지네비게이션을 위해 MypagePageService클래스를 이용
		pageNav = mpPage.setPageNav(pageNav, pageNum, pageBlock, member_idx);
		
		// html에서 사용하기 위해 세팅
		model.addAttribute("pageNav", pageNav);
				
		return "mypage/mypage_productQnA";
	}
	
	//상품QnA 삭제 요청 처리
	@PostMapping("/mypage_inqdel_process.do")
	public String deleteinq(ProductInqVo vo, HttpServletRequest request) {
		//request객체는 세션에 저장된 회원번호를 알아내기 위해 필요함
		HttpSession session = request.getSession();
		MemberVo mVo = (MemberVo)session.getAttribute("member");		
		int member_idx = mVo.getMember_idx();	
		vo.setMember_idx(member_idx);
		System.out.println("Member번호뭐냐"+vo.getMember_idx());
		System.out.println("문의번호:"+vo.getProduct_inq_idx());
		
		int result=mpDelete.deleteinq(vo);		
		String viewPage = "boast/view";
		if(result==1) {//글삭제 성공시
			viewPage = "redirect:/mypage/mypage_productQnA.do?";
		}
		return viewPage;			
	}
	
	//상품QnA 수정 요청 처리
	@PostMapping("/mypage_oneinqModify_process.do")
	public String oneinqModify(ProductInqVo vo, HttpServletRequest request) {
		HttpSession session = request.getSession();		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");		
		int member_idx = mVo.getMember_idx();		
		vo.setMember_idx(member_idx);
		System.out.println("멤버번호:"+vo.getMember_idx());
		System.out.println("문의번호:"+vo.getProduct_inq_idx());
		System.out.println("콘텐츠내용:"+vo.getProduct_inq_content());
		
		int result = mpUpdate.updateproductinq(vo);			
				
		String viewPage = "boast/view";
		if(result==1) {//글삭제 성공시
			viewPage = "redirect:/mypage/mypage_productQnA.do";
		}
		return viewPage;			
	}
	
	
	
	
	
	
	
	
	
	
	
	
}