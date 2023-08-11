package com.crfr.controller;

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

import com.crfr.service.mypage.MypageService;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ReviewExploreVo;
import com.crfr.vo.ReviewVo;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	MypageService mpList, mpPage, mpCount, mpInsert, mpUpdate, mpDelete;
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
	
	

	@GetMapping("/mypage_main.do")
	public String mypage_main() {
		return "mypage/mypage_main";
	}

	@GetMapping("/mypage_nonreview.do")
	public String mypage_nonreview(int member_idx, String pageNum, String pageBlock, Model model) {

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

	@GetMapping("/mypage_review.do")
	public String mypage_review(int member_idx, String pageNum, String pageBlock, Model model) {

		// 내가 구매한 목록 중 리뷰를 작성한 사진목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<FileVo> reviewfileList = mpList.selectmyreviewListimg(member_idx);
		model.addAttribute("reviewfileList", reviewfileList);

		// 내가 구매한 목록 중 리뷰를 작성한 목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<ReviewExploreVo> reviewproductList = mpList.selectmyreviewList(member_idx);
		model.addAttribute("reviewproductList", reviewproductList);

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

	@PostMapping("/mypage_review_write_process.do")
	public String mypage_review_insert1(MultipartFile[] attachedFile, ReviewVo vo, HttpServletRequest request) {

		// 아래 내용이 성공적으로 이루어지지 않으면 실패페이지 주소 반환
		String viewpage = "mypage_review_err";

		// 리뷰내용 작성
		int insertreview = mpInsert.insertreview(vo);
		// 위를 통해 mysql의 review테이블에 내용에 관한 쿼리가 삽입되는데, 이 때 쿼리에서 autoincrement되어 생성된
		// review_idx값 조회하여 반환해야 한다
		// 그래야 사진을 삽입하는데 파일테이블에 삽입될 review_idx를 얻어올 수 있기 때문이다

		// review_idx값 조회
		int searchReview_idx = mpInsert.selectReview_idx(vo);

		int insertreviewimg = 0;

		// 리뷰사진 작성 및 searchReview_idx에서 얻은값까지 같이 건네주기
		insertreviewimg = mpInsert.insertreviewimg(attachedFile, request, searchReview_idx);

		// 리뷰내용과 리뷰사진이 둘 다 제대로 sql에 삽입되었다면 맨 처음 나의리뷰페이지 주소값을 반환
		if (insertreview == 1 && insertreviewimg == 1) {
			viewpage = "redirect:/mypage/test.do";
		}
		return viewpage;
	}

	@GetMapping("/test.do")
	public String mypage_test() {
		return "mypage/test";
	}

	@GetMapping("/mypage_deliverymain.do")
	public String mypage_deliverymain(int member_idx, String pageNum, String pageBlock, Model model) {

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

	
	
	
	
	
	
	
	//기본배송지수정 ,배송지수정, 배송지삭제 구현
	
	//댓글삭제 요청 처리
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
				viewPage = "redirect:/mypage/mypage_deliverymain.do?member_idx=1";
			}
			return viewPage;			
		}
	
	
	
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
				viewPage = "redirect:/mypage/mypage_deliverymain.do?member_idx=1";
			}
			return viewPage;			
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/mypage_deliveryreg.do")
	public String mypage_test4() {
		return "mypage/mypage_deliveryreg";
	}
	
	@PostMapping("/mypage_deliveryreg_write_process.do")
	public String mypage_deliveryreg_insert1(DeliveryVo vo, HttpServletRequest request) {

		// 아래 내용이 성공적으로 이루어지지 않으면 실패페이지 주소 반환
		String viewpage = "mypage_review_err";

		// 배송지 등록
		int insertreview = mpInsert.insertdeliveryPost(vo);

		// 배송지가 제대로 sql에 삽입되었다면 맨 처음 나의배송지페이지 주소값을 반환
		if (insertreview == 1) {
			viewpage = "redirect:/mypage/mypage_deliverymain.do";
		}
		return viewpage;
	}

}