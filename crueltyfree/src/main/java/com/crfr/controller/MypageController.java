package com.crfr.controller;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
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

import com.crfr.service.member.MemberService;
import com.crfr.service.mypage.MypageService;
import com.crfr.service.oneInq.OneInqService;
import com.crfr.service.orderDelivery.OrderDeliveryService;
import com.crfr.vo.CouponVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.LikeExploreVo;
import com.crfr.vo.MemberVo;
import com.crfr.vo.OneInqVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ReviewExploreVo;
import com.crfr.vo.ReviewVo;

import lombok.Setter;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	MypageService mpList, mpPage, mpCount, mpInsert, mpUpdate, mpDelete, mpView;
	PageNav pageNav;
	
	@Setter(onMethod_={ @Autowired })
	OneInqService mListNotice;
	
	@Setter(onMethod_={ @Autowired })
	OrderDeliveryService mSelectCountPayEd, mSelectCountDlvIng, mSelectCountDlvEd;
	
	@Setter(onMethod_={ @Autowired })
	MemberService mSelectCountMemberIdxReview, mInsertCouponReview;
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
	public String mypage_main(OneInqVo vo,HttpServletRequest request, Model model) {
				
		HttpSession session = request.getSession();		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");		
		int member_idx = mVo.getMember_idx();		
		vo.setMember_idx(member_idx);
		
		//좋아요 사진목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<FileVo> likefileList = mpList.selectlikeListimg(member_idx);
		model.addAttribute("likefileList", likefileList);

		//좋아요 목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<LikeExploreVo> likeproductList = mpList.selectlikeList(member_idx);
		model.addAttribute("likeproductList", likeproductList);

		//1:1문의 내역 리스트
		List<OneInqVo> oneinqList = mListNotice.oneinqList(vo);
		model.addAttribute("oneinqList", oneinqList);
		
		// 상품QnA 내역 리스트
		// 내가 구매한 목록 중 리뷰를 작성한 목록을 가져오는 요청에 대한 처리를 위한 MypageListService 클래스 이용
		List<ProductInqVo> inqproductList = mpList.selectproductinqList(member_idx);
		model.addAttribute("inqproductList", inqproductList);
			
		Timestamp timestamp_begin = null;
		Timestamp timestamp_end = null;
		
	    LocalDate today = LocalDate.now();

	    // 오늘 날짜에 1개월을 빼서 설정
	    LocalDate oneMonthAgo = today.minusMonths(1);
	    LocalDateTime localDateTime = oneMonthAgo.atStartOfDay();

	    // LocalDateTime을 java.sql.Timestamp로 변환하여 timestamp_begin 설정
	    timestamp_begin = Timestamp.valueOf(localDateTime);

	    // 오늘 날짜에 1일을 더해서 timestamp_end 설정
	    timestamp_end = Timestamp.valueOf(today.plusDays(1).atStartOfDay());
		
		//주문배송조회 정보제공용 카운트 수
		int payEd = mSelectCountPayEd.selectCountPayEd(member_idx, timestamp_begin, timestamp_end);
		int dlvIng = mSelectCountDlvIng.selectCountDlvIng(member_idx, timestamp_begin, timestamp_end);
		int dlvEd = mSelectCountDlvEd.selectCountDlvEd(member_idx, timestamp_begin, timestamp_end);
		//모델에 세팅
		model.addAttribute("payEd", payEd);
		model.addAttribute("dlvIng", dlvIng);
		model.addAttribute("dlvEd", dlvEd);		
		
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
		
		// 현재 날짜 가져오기
		LocalDate today = LocalDate.now();

		// 90일 후의 날짜 계산
		LocalDate dateAfter90Days = today.plus(90, ChronoUnit.DAYS);
		
		Date dateAfter90DaysAsDate = Date.from(dateAfter90Days.atStartOfDay(ZoneId.systemDefault()).toInstant());
		
		//리뷰테이블 검색결과 1이면 쿠폰 발급하기
		if(mVo != null) {
			int reviewCountResult = mSelectCountMemberIdxReview.selectCountMemberIdxReview(mVo);
			if(reviewCountResult == 1){
				int reviewCouponResult = mInsertCouponReview.insertCouponReview(member_idx, dateAfter90DaysAsDate);
			}
		}
		
		
			
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
		vo.getReview_idx();
		
//		String originFileName0 = attachedFile[0].getOriginalFilename();
//		String originFileName1 = attachedFile[1].getOriginalFilename();
//		String originFileName2 = attachedFile[2].getOriginalFilename();
//		System.out.println("리뷰번호:"+vo.getReview_idx());
//		System.out.println("멤버번호:"+vo.getMember_idx());
//		System.out.println("상품번호:"+vo.getProduct_idx());
//		System.out.println("리뷰스코어:"+vo.getReview_score());
//		System.out.println("리뷰내용:"+vo.getReview_content());
//		System.out.println("멤버닉네임:"+vo.getMember_nickname());
//		System.out.println("0번째방: "+originFileName0+"\n");		
//		System.out.println("1번째방: "+originFileName1+"\n");
//		System.out.println("2번째방: "+originFileName2+"\n");
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
//		System.out.println("파일번호idx:"+vo.getFile_idx());
//		for(int i = 0; i < attachedFile.length; i++) {
//		if(!attachedFile[i].isEmpty()) {
		
		
		
		
		List<ReviewVo> reviewVoList = mpList.reviewRegList2(vo);
		
		int i = 0;
		for(ReviewVo reVo: reviewVoList) {
			
			int searchReview_idx = reVo.getFile_idx();
			int searchRealReview_idx = reVo.getReview_idx();
			FileVo vo2 = new FileVo();
			vo2.setFile_idx(reVo.getFile_idx()); 
			
//			System.out.println("파일번호"+reVo.getFile_idx());
			if(i==0){
//				String origin = attachedFile[0].getOriginalFilename();
//				System.out.println("오리진파일:"+origin);
				if(!attachedFile[0].isEmpty()) {
					
					//reVo.getOriginFile() != null => 이미등록된게 있음 = 업데이트
					//reVo.getOriginFile() == null => 등록된게없음 = 업데이트 
					if( mpDelete.checkreviewimg1(vo2) == 1) {
				insertreviewimg = mpUpdate.updatereviewimg0(attachedFile,request, searchReview_idx);
				System.out.println("insertreviewimg의 0번째 값"+insertreviewimg);
				System.out.println("0번째방 파일번호"+reVo.getFile_idx());
					}
					else {//사진 새로 넣기
						mpInsert.upinsertreviewimg0(attachedFile,request, searchRealReview_idx);
					}
				}
				//1.글등록시 등록하였던 기존의 사진 A.jpg를 B.jpg로 수정하여 올렸을 경우, 
				//JS에서 전달하는 파일업로드의 데이터는 "B.jpg"이며,
				//해당하는 방의 DB의 originFile의 값은 A.jpg -> B.jpg로 수정되어야한다.

				//2.글등록시 등록하였던 기존의 사진 없고 사진을 업로드 하였을 경우,
				//JS에서 전달하는 파일업로드의 데이터는 "B.jpg"이며,
				//해당하는 방의 DB의 originFile의 값은 Null -> "B.jpg"로 수정되어야한다.
																
				//3.글등록시 등록하였던 기존의 사진이 없고 사진을 업로드 하지 않았을 경우,
				//JS에서 전달하는 파일업로드의 데이터는 ""이며,
				//해당하는 방의 DB의 originFile의 값은 Null -> Null로 수정되어야한다.
				
				//4.글등록시 등록하였던 기존의 사진 A.jpg 제거하고 수정하여 올렸을 경우, 
				//JS에서 전달하는 파일업로드의 데이터는 ""이며, 
				//해당하는 방의DB의 originFile의 값은 A.jpg -> Null로 수정되어야한다.
								
				//5.글등록시 등록하였던 기존의 사진 A.jpg를 유지한 채로 수정하여 올렸을 경우,
				//JS에서 전달하는 파일업로드의 데이터는 ""이며,				
				//해당하는 방의 DB의 originFile의 값은 A.jpg -> A.jpg로 유지되어야한다.
					
				else {//인풋파일타입 비어있을떄
					System.out.println("0번째방 사진 안올렸을 때 여기일테고 파일번회:"+vo2.getFile_idx());
					
					//reVo.getOriginFile() != null => 이미등록된게 있음 =1.삭제 2.유지
					
					
					if(reVo.getOriginFile() != null) {
//						if(  ) {
//							//리퀘스트 무언가 삭제버튼을 클릭하면 삭제
//						}
					}
					
				
				
				
				//reVo.getOriginFile() == null => 등록된게없음 = 할거없음
				
//					if( mpDelete.checkreviewimg0(vo2) == 1) {
//						int checkehcek=1;
//						System.out.println("0번 쿼리조회결과:"+ mpDelete.checkreviewimg0(vo2));
//					}else {
//						System.out.println("0번의 제거가 실행되나?");
//						mpDelete.deletereviewimg0(vo2);
//					}
					
					
					
				}
				
				
				
				
				
				
				
				
				
			}else if(i==1) {
				
				if(!attachedFile[1].isEmpty()) {
					if( mpDelete.checkreviewimg1(vo2) == 1) {
				insertreviewimg = mpUpdate.updatereviewimg1(attachedFile,request, searchReview_idx);
				System.out.println("insertreviewimg의 1번째 값"+insertreviewimg);
				System.out.println("1번째방 파일번호"+reVo.getFile_idx());
					}else {//사진 새로 넣기
						mpInsert.upinsertreviewimg1(attachedFile,request, searchRealReview_idx);
					}
				}else {
					System.out.println("1번째방 사진 안올렸을 때 여기일테고 파일번회:"+vo2.getFile_idx());
					if( mpDelete.checkreviewimg1(vo2) == 1) {
						int checkehcek=1;
						System.out.println("1번 쿼리조회결과:"+ mpDelete.checkreviewimg1(vo2));
					}else {
						System.out.println("1번의 제거가 실행되나?");
					mpDelete.deletereviewimg1(vo2);
					}
				}
				
			}else if(i==2) {
				if(!attachedFile[2].isEmpty()) {
					
					if( mpDelete.checkreviewimg2(vo2) == 1) {
				insertreviewimg = mpUpdate.updatereviewimg2(attachedFile,request, searchReview_idx);
				System.out.println("insertreviewimg의 2번째 값"+insertreviewimg);
					}
					else {//사진 새로 넣기
						mpInsert.upinsertreviewimg2(attachedFile,request, searchRealReview_idx);
					}
				}else {
					System.out.println("2번째방 사진 안올렸을 때 여기일테고 파일번회:"+vo2.getFile_idx());
					if( mpDelete.checkreviewimg2(vo2) == 1) {
						int checkehcek=1;
						System.out.println("2번 쿼리조회결과:"+ mpDelete.checkreviewimg2(vo2));
					}else {
						System.out.println("2번의 제거가 실행되나?");
					mpDelete.deletereviewimg2(vo2);
					}
				}
				
			}else if(i==3) {
				if(!attachedFile[3].isEmpty()) {
						System.out.println("여기가 맞지?");
					if( mpDelete.checkreviewimg3(vo2) == 1) {
						System.out.println("여기가 실행되는건가??");
				insertreviewimg = mpUpdate.updatereviewimg3(attachedFile,request, searchReview_idx);
				System.out.println("insertreviewimg의 3번째 값"+insertreviewimg);
					}
					else {//사진 새로 넣기
						System.out.println("☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆출력");
						mpInsert.upinsertreviewimg3(attachedFile,request, searchRealReview_idx);
					}
				}else {
					System.out.println("3번째방 사진 안올렸을 때 여기일테고 파일번회:"+vo2.getFile_idx());
					if( mpDelete.checkreviewimg3(vo2) == 1) {
						int checkehcek=1;
						System.out.println("3번 쿼리조회결과:"+ mpDelete.checkreviewimg3(vo2));
					}else {
						System.out.println("3번의 제거가 실행되나?");
					mpDelete.deletereviewimg3(vo2);
					}
				}
				
			}else{
				if(!attachedFile[4].isEmpty()) {
					if( mpDelete.checkreviewimg3(vo2) == 1) {
				insertreviewimg = mpUpdate.updatereviewimg4(attachedFile,request, searchReview_idx);
				System.out.println("insertreviewimg의 4번째 값"+insertreviewimg);
					}
					else {//사진 새로 넣기
						mpInsert.upinsertreviewimg4(attachedFile,request, searchRealReview_idx);
					}
				}else {
					System.out.println("4번째방 사진 안올렸을 때 여기일테고 파일번회:"+vo2.getFile_idx());
					if( mpDelete.checkreviewimg4(vo2) == 1) {
						int checkehcek=1;
						System.out.println("4번 쿼리조회결과:"+ mpDelete.checkreviewimg4(vo2));
					}else {
						System.out.println("4번의 제거가 실행되나?");
					mpDelete.deletereviewimg4(vo2);
					}
				}				
			}			
			i++;
			//System.out.println("마지막for문 끝내기 전에 쿼리조회결과:"+ mpDelete.deletereviewimg1(vo2));
		}
		
//		int searchRealReview_idx = vo.getReview_idx();
//		
//		if(!attachedFile[0].isEmpty()) {
//			mpInsert.upinsertreviewimg0(attachedFile,request, searchRealReview_idx);			
//		}
//		if(!attachedFile[1].isEmpty()) {
//			mpInsert.upinsertreviewimg1(attachedFile,request, searchRealReview_idx);			
//		}
//		if(!attachedFile[2].isEmpty()) {
//			mpInsert.upinsertreviewimg2(attachedFile,request, searchRealReview_idx);			
//		}
//		if(!attachedFile[3].isEmpty()) {
//			mpInsert.upinsertreviewimg3(attachedFile,request, searchRealReview_idx);			
//		}
//		if(!attachedFile[4].isEmpty()) {
//			mpInsert.upinsertreviewimg4(attachedFile,request, searchRealReview_idx);			
//		}
		
		
		
		
//		System.out.println("insertreviewming=?"+insertreviewimg);
			
		if(insertreviewimg!=1){
			insertreviewimg =1;
		}
		
//		System.out.println("이후 insertreviewming=?"+insertreviewimg);
//		System.out.println("insertreview=?"+insertreview);
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
	public String mypage_modify_changepassword_process(String member_pw_change, HttpServletRequest request, Model model
			,RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		
		//로그인된 회원의 member_idx 얻기
		MemberVo vo = (MemberVo)session.getAttribute("member");
		vo.setMember_pw(member_pw_change);
		
		int ok = mpUpdate.changepassword(vo);
		// 아래 내용이 성공적으로 이루어지지 않으면 실패페이지 주소 반환
		
		if(ok == 1){//회원정보 수정 성공시;
			session.removeAttribute("member");
			session.setAttribute("member", vo);
			redirectAttributes.addFlashAttribute("msgOk", "비밀번호가 성공적으로 수정되었습니다.");
		}else {
			redirectAttributes.addFlashAttribute("msgFail", "비밀번호 수정에 실패하였습니다.");
		}		
		return "redirect:/mypage/mypage_modifymain.do";
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
			result = mpDelete.deletelike(vo);
		}
		System.out.println("삭제됨?"+result);
		String viewPage = "boast/view";
		if(result==1) {//글삭제 성공시
			viewPage = "redirect:/mypage/mypage_like.do";
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
		for(ProductInqVo vo1 : inqproductList) {
			if(vo1.getProduct_inq_regDate() != null) {
				Date orderDate = vo1.getProduct_inq_regDate();
				Date adjustedDate = new Date(orderDate.getTime() - (9 * 60 * 60 * 1000)); // 9시간을 밀리초로 변환하여 뺌
				vo1.setProduct_inq_regDate(adjustedDate);				
			}
		}		
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