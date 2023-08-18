package com.crfr.service.mypage;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.crfr.dao.MypageDao;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ReviewVo;

@Service("mpInsert")
public class MypageInsertService implements MypageService {
	private MypageDao dao;
	
	@Autowired
	public MypageInsertService(MypageDao dao) {
		this.dao = dao;
	}
	
	public int insertreview(ReviewVo vo) {
		return dao.insertreview(vo);}
	
	public int selectReview_idx(ReviewVo vo) {
		return dao.selectReview_idx(vo);}
		
	public int insertreviewimg(MultipartFile[] attachedFile,
			   HttpServletRequest request, int searchReview_idx) {		
		int result=0;
		for(int i = 0; i < attachedFile.length; i++) {
			if(!attachedFile[i].isEmpty()) {
			System.out.println("배열의길이:"+attachedFile.length);

				String originFileName = attachedFile[i].getOriginalFilename(); //원본 파일 이름
				String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
				String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
				String saveFileName = now+ext;//새로운 파일이름: 업로드 일시.확장자	
				String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
				String fullPath = saveDirectory+saveFileName;					
				System.out.println("attachedFile: "+attachedFile[i]);
		//		File fileCheck = new File(fullPath);		
		//		if(!fileCheck.exists()) fileCheck.mkdirs();							
				try {			
					attachedFile[i].transferTo(new File(fullPath));															
				}catch(IllegalStateException | IOException e) {
					System.out.println("파일 저장 중 예외 발생");
					e.printStackTrace();
				}					
				//위 값을 아래 저장하기
				FileVo vo = new FileVo();
				vo.setOriginFile(originFileName);
				vo.setSaveFile(saveFileName);
				vo.setReview_idx(searchReview_idx);					
				result = dao.insertreviewimg(vo);
				}
			}
		return result;}
				
	public int insertdeliveryPost(DeliveryVo vo) {
		return dao.insertdeliveryPost(vo);
	}
	
	public int insertdeliveryPost_normal(DeliveryVo vo) {
		return dao.insertdeliveryPost_normal(vo);
	}
	
	public int insertConfirm(int product_inq_idx, String product_inq_answer) {
		System.out.println("마이서비스까지는 가지는건가?");
		return dao.insertConfirm(product_inq_idx, product_inq_answer);
	}
	
	
	//리뷰 사진 업데이트0~4
	//0
	public int upinsertreviewimg0(MultipartFile[] attachedFile,
			   HttpServletRequest request, int searchReview_idx) {		
		int result=0;		
			if(!attachedFile[0].isEmpty()) {
			System.out.println("배열의길이:"+attachedFile.length);
			
				String originFileName = attachedFile[0].getOriginalFilename(); //원본 파일 이름
				String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
				String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
				String saveFileName = now+ext;//새로운 파일이름: 업로드 일시.확장자	
				String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
				String fullPath = saveDirectory+saveFileName;					
				System.out.println("attachedFile: "+attachedFile[0]);
			//		File fileCheck = new File(fullPath);		
			//		if(!fileCheck.exists()) fileCheck.mkdirs();							
				try {			
					attachedFile[0].transferTo(new File(fullPath));
					
				}catch(IllegalStateException | IOException e) {
					System.out.println("파일 저장 중 예외 발생");
					e.printStackTrace();
				}					
				//위 값을 아래 저장하기
				FileVo vo = new FileVo();
				vo.setOriginFile(originFileName);
				vo.setSaveFile(saveFileName);				
				vo.setReview_idx(searchReview_idx);				
				result = dao.upinsertreviewimg0(vo);
				}
			
		return result;}
	
	//1
		public int upinsertreviewimg1(MultipartFile[] attachedFile,
				   HttpServletRequest request, int searchReview_idx) {		
			int result=0;		
				if(!attachedFile[1].isEmpty()) {
				System.out.println("배열의길이:"+attachedFile.length);
				
					String originFileName = attachedFile[1].getOriginalFilename(); //원본 파일 이름
					String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
					String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
					String saveFileName = now+ext;//새로운 파일이름: 업로드 일시.확장자	
					String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
					String fullPath = saveDirectory+saveFileName;					
					System.out.println("attachedFile: "+attachedFile[1]);
				//		File fileCheck = new File(fullPath);		
				//		if(!fileCheck.exists()) fileCheck.mkdirs();							
					try {			
						attachedFile[0].transferTo(new File(fullPath));
						
					}catch(IllegalStateException | IOException e) {
						System.out.println("파일 저장 중 예외 발생");
						e.printStackTrace();
					}					
					//위 값을 아래 저장하기
					FileVo vo = new FileVo();
					vo.setOriginFile(originFileName);
					vo.setSaveFile(saveFileName);				
					vo.setReview_idx(searchReview_idx);
					result = dao.upinsertreviewimg1(vo);
					}
				
			return result;}
		
		//2
		public int upinsertreviewimg2(MultipartFile[] attachedFile,
				   HttpServletRequest request, int searchReview_idx) {		
			int result=0;		
				if(!attachedFile[2].isEmpty()) {
				System.out.println("배열의길이:"+attachedFile.length);
				
					String originFileName = attachedFile[2].getOriginalFilename(); //원본 파일 이름
					String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
					String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
					String saveFileName = now+ext;//새로운 파일이름: 업로드 일시.확장자	
					String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
					String fullPath = saveDirectory+saveFileName;					
					System.out.println("attachedFile: "+attachedFile[2]);
				//		File fileCheck = new File(fullPath);		
				//		if(!fileCheck.exists()) fileCheck.mkdirs();							
					try {			
						attachedFile[0].transferTo(new File(fullPath));
						
					}catch(IllegalStateException | IOException e) {
						System.out.println("파일 저장 중 예외 발생");
						e.printStackTrace();
					}					
					//위 값을 아래 저장하기
					FileVo vo = new FileVo();
					vo.setOriginFile(originFileName);
					vo.setSaveFile(saveFileName);				
					vo.setReview_idx(searchReview_idx);
					result = dao.upinsertreviewimg2(vo);
					}
				
			return result;}
		
		//3
		public int upinsertreviewimg3(MultipartFile[] attachedFile,
				   HttpServletRequest request, int searchReview_idx) {		
			int result=0;		
				if(!attachedFile[3].isEmpty()) {
				System.out.println("배열의길이:"+attachedFile.length);
				
					String originFileName = attachedFile[3].getOriginalFilename(); //원본 파일 이름
					String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
					String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
					String saveFileName = now+ext;//새로운 파일이름: 업로드 일시.확장자	
					String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
					String fullPath = saveDirectory+saveFileName;					
					System.out.println("attachedFile: "+attachedFile[3]);
				//		File fileCheck = new File(fullPath);		
				//		if(!fileCheck.exists()) fileCheck.mkdirs();							
					try {			
						attachedFile[0].transferTo(new File(fullPath));
						
					}catch(IllegalStateException | IOException e) {
						System.out.println("파일 저장 중 예외 발생");
						e.printStackTrace();
					}					
					//위 값을 아래 저장하기
					FileVo vo = new FileVo();
					vo.setOriginFile(originFileName);
					vo.setSaveFile(saveFileName);				
					vo.setReview_idx(searchReview_idx);
					result = dao.upinsertreviewimg3(vo);
					}
				
			return result;}
		
		//4
		public int upinsertreviewimg4(MultipartFile[] attachedFile,
				   HttpServletRequest request, int searchReview_idx) {		
			int result=0;		
				if(!attachedFile[4].isEmpty()) {
				System.out.println("배열의길이:"+attachedFile.length);
				
					String originFileName = attachedFile[4].getOriginalFilename(); //원본 파일 이름
					String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
					String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
					String saveFileName = now+ext;//새로운 파일이름: 업로드 일시.확장자	
					String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
					String fullPath = saveDirectory+saveFileName;					
					System.out.println("attachedFile: "+attachedFile[4]);
				//		File fileCheck = new File(fullPath);		
				//		if(!fileCheck.exists()) fileCheck.mkdirs();							
					try {			
						attachedFile[0].transferTo(new File(fullPath));
						
					}catch(IllegalStateException | IOException e) {
						System.out.println("파일 저장 중 예외 발생");
						e.printStackTrace();
					}					
					//위 값을 아래 저장하기
					FileVo vo = new FileVo();
					vo.setOriginFile(originFileName);
					vo.setSaveFile(saveFileName);				
					vo.setReview_idx(searchReview_idx);
					result = dao.upinsertreviewimg4(vo);
					}
				
			return result;}
	
}
