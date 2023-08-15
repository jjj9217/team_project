package com.crfr.service.mypage;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.crfr.dao.MypageDao;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.MemberVo;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ReviewVo;

@Service("mpUpdate")
public class MypageUpdateService implements MypageService {
	private MypageDao dao;
	
	@Autowired
	public MypageUpdateService(MypageDao dao) {
		this.dao = dao;
	}
		
	public int updatedeliveryPostdefault (DeliveryVo vo) {
		return dao.updatedeliveryPostdefault(vo);
	}
	
	public int updatedeliveryPostchangedefault(DeliveryVo vo) {
		return dao.updatedeliveryPostchangedefault(vo);
	}
	
	public int updatedeliveryPost(DeliveryVo vo) {
		return dao.updatedeliveryPost(vo);
	}	
	
	public int changepassword(MemberVo vo) {
		return dao.changepassword(vo);
	}
	
	public int updatereview(ReviewVo vo) {
		return dao.updatereview(vo);
	}
	
	//리뷰 사진 업데이트0~4
	//0
	public int updatereviewimg0(MultipartFile[] attachedFile,
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
				vo.setFile_idx(searchReview_idx);
				result = dao.updatereviewimg0(vo);
				}			
		return result;}
	
	//1
	public int updatereviewimg1(MultipartFile[] attachedFile,
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
				System.out.println("업데이트서비스1의 파일번호가 맞게왔는가" +searchReview_idx);
			//		File fileCheck = new File(fullPath);		
			//		if(!fileCheck.exists()) fileCheck.mkdirs();							
				try {			
					attachedFile[1].transferTo(new File(fullPath));
					
				}catch(IllegalStateException | IOException e) {
					System.out.println("파일 저장 중 예외 발생");
					e.printStackTrace();
				}					
				//위 값을 아래 저장하기
				FileVo vo = new FileVo();
				vo.setOriginFile(originFileName);
				vo.setSaveFile(saveFileName);
				vo.setFile_idx(searchReview_idx);					
				result = dao.updatereviewimg0(vo);
				}			
		return result;}
	
	//2
	public int updatereviewimg2(MultipartFile[] attachedFile,
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
					attachedFile[2].transferTo(new File(fullPath));
					
				}catch(IllegalStateException | IOException e) {
					System.out.println("파일 저장 중 예외 발생");
					e.printStackTrace();
				}					
				//위 값을 아래 저장하기
				FileVo vo = new FileVo();
				vo.setOriginFile(originFileName);
				vo.setSaveFile(saveFileName);
				vo.setFile_idx(searchReview_idx);					
				result = dao.updatereviewimg0(vo);
				}			
		return result;}
	
	//3
	public int updatereviewimg3(MultipartFile[] attachedFile,
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
					attachedFile[3].transferTo(new File(fullPath));
					
				}catch(IllegalStateException | IOException e) {
					System.out.println("파일 저장 중 예외 발생");
					e.printStackTrace();
				}					
				//위 값을 아래 저장하기
				FileVo vo = new FileVo();
				vo.setOriginFile(originFileName);
				vo.setSaveFile(saveFileName);
				vo.setFile_idx(searchReview_idx);					
				result = dao.updatereviewimg0(vo);
				}			
		return result;}
	
	//4
	public int updatereviewimg4(MultipartFile[] attachedFile,
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
					attachedFile[4].transferTo(new File(fullPath));
					
				}catch(IllegalStateException | IOException e) {
					System.out.println("파일 저장 중 예외 발생");
					e.printStackTrace();
				}					
				//위 값을 아래 저장하기
				FileVo vo = new FileVo();
				vo.setOriginFile(originFileName);
				vo.setSaveFile(saveFileName);
				vo.setFile_idx(searchReview_idx);					
				result = dao.updatereviewimg0(vo);
				}			
		return result;}
		
	public int updateproductinq (ProductInqVo vo) {
		return dao.updateproductinq(vo);
	}
	
	public MemberVo updateMemberInfo(MemberVo memberVo) {
		return dao.updateMemberInfo(memberVo);
	}	
}
