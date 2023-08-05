package com.crfr.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.crfr.service.mypage.MypageService;
import com.crfr.vo.FileVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ReviewExploreVo;
import com.crfr.vo.ReviewVo;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	MypageService mpList, mpPage, mpCount, mpInsert;
	PageNav pageNav;
		
	@Autowired
	public void setMpList(@Qualifier("mpList") MypageService mpList) {this.mpList = mpList;}
	
	@Autowired
	public void setMpPage(@Qualifier("mpPage") MypageService mpPage, PageNav pageNav) {
		this.mpPage = mpPage;
		this.pageNav = pageNav;
		}
		
	@Autowired
	public void setMpCount(@Qualifier("mpCount") MypageService mpCount) {this.mpCount = mpCount;}

	@Autowired
	public void setMpInsert(@Qualifier("mpInsert") MypageService mpInsert) {this.mpInsert = mpInsert;}
	
	@GetMapping("/mypage_main.do")
	public String mypage_main() {		
		return "mypage/mypage_main";
	}
	
	@GetMapping("/mypage_nonreview.do")
	public String mypage_nonreview(int member_idx ,String pageNum, String pageBlock, Model model) {		
		
		//내가 구매한 목록 중 리뷰를 작성하지 않은 사진목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<FileVo> nonreviewfileList = mpList.selectmynonreviewListimg(member_idx);
		model.addAttribute("nonreviewfileList", nonreviewfileList);
		
		//내가 구매한 목록 중 리뷰를 작성하지 않은 목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<ReviewExploreVo> nonreviewproductList = mpList.selectmynonreviewList(member_idx);		
		model.addAttribute("nonreviewproductList", nonreviewproductList);
									
		//총 레코드 수를 가져오기 위해 MypageCountService클래스 이용
		int searchTotal = mpCount.selectmynonreviewCount(member_idx);
			
		//총 레코드 수 대입
		pageNav.setTotalRows(searchTotal);		
		//페이지네비게이션을 위해 MypagePageService클래스를 이용		
		pageNav = mpPage.setPageNav(pageNav, pageNum, pageBlock, member_idx);

		//html에서 사용하기 위해 세팅
		model.addAttribute("pageNav", pageNav);
	
		/*
		 * System.out.println("뭐라고 뜰까1?" +nonreviewfileList.get(0).toString());
		 * System.out.println("뭐라고 뜰까2?" +nonreviewfileList.get(1).toString());
		 * System.out.println("뭐라고 뜰까3?" +nonreviewfileList.get(2).toString());
		 * System.out.println("뭐라고 뜰까4?" +nonreviewfileList.get(3).toString());
		 * System.out.println("뭐라고 뜰까5?" +nonreviewfileList.get(4).toString());
		 */
		return "mypage/mypage_nonreview";
	}
	
	
	@GetMapping("/mypage_review.do")
	public String mypage_review(int member_idx ,String pageNum, String pageBlock, Model model) {		
		
		//내가 구매한 목록 중 리뷰를 작성한 사진목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<FileVo> reviewfileList = mpList.selectmyreviewListimg(member_idx);
		model.addAttribute("reviewfileList", reviewfileList);
		
		//내가 구매한 목록 중 리뷰를 작성한 목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<ReviewExploreVo> reviewproductList = mpList.selectmyreviewList(member_idx);		
		model.addAttribute("reviewproductList", reviewproductList);
									
		//총 레코드 수를 가져오기 위해 MypageCountService클래스 이용
		int searchTotal = mpCount.selectmyreviewCount(member_idx);
				
		//총 레코드 수 대입
		pageNav.setTotalRows(searchTotal);		
		//페이지네비게이션을 위해 MypagePageService클래스를 이용		
		pageNav = mpPage.setPageNav(pageNav, pageNum, pageBlock, member_idx);

		//html에서 사용하기 위해 세팅
		model.addAttribute("pageNav", pageNav);
		return "mypage/mypage_review";
	}
			
	
	
	@PostMapping("/mypage_review_write_process.do")
	public String mypage_review_insert1(List<MultipartFile> attachedFile, ReviewVo vo, String pageNum, String pageBlock, HttpServletRequest request) {
		
		//아래 내용이 성공적으로 이루어지지 않으면 실패페이지 주소 반환
		String viewpage = "mypage_review_err";	

		//리뷰내용 작성
		int insertreview = mpInsert.insertreview(vo);						
		//위를 통해 mysql의 review테이블에 내용에 관한 쿼리가 삽입되는데, 이 때 쿼리에서 autoincrement되어 생성된 review_idx값 조회하여 반환해야 한다
		//그래야 사진을 삽입하는데 파일테이블에 삽입될 review_idx를 얻어올 수 있기 때문이다
		
		//review_idx값 조회
		int searchReview_idx = mpInsert.selectReview_idx(vo);
				
		//리뷰사진 작성 및 searchReview_idx에서 얻은값까지 같이 건네주기
		int insertreviewimg = mpInsert.insertreviewimg(attachedFile, request, searchReview_idx);
		
		//리뷰내용과 리뷰사진이 둘 다 제대로 sql에 삽입되었다면 맨 처음 나의리뷰페이지 주소값을 반환  
		if(insertreview == 1 && insertreviewimg == 1) {
			viewpage="redirect:mypage/mypage_review";
		}		
		return viewpage; 
	}
	
	
	
	
	@GetMapping("/test.do")
	public String mypage_test() {		
		return "mypage/test";
	}
	
}
