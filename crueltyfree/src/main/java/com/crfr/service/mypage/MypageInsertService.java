package com.crfr.service.mypage;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.crfr.dao.MypageDao;
import com.crfr.vo.FileVo;
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

		String originFileName = attachedFile[i].getOriginalFilename(); //원본 파일 이름
		String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String saveFileName = now+ext;//새로운 파일이름: 업로드 일시.확장자
	
		String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
		String fullPath = saveDirectory+saveFileName;
		
//		File fileCheck = new File(fullPath);		
//		if(!fileCheck.exists()) fileCheck.mkdirs();
		
			
		try {			
			attachedFile[i].transferTo(new File(fullPath));			
									
		}catch(IllegalStateException | IOException e) {
			System.out.println("파일 저장 중 예외 발생");
			e.printStackTrace();
		}
		
		//다중 파일이니 위 값을 여러번 돌리고, 이 아래에서도 여러번 돌려진 뒤 세팅해서 return값을 넘겨줘야할거같은데
		//3. 다른 폼의 전달값을 BoardFileVo에 저장하기
		FileVo vo = new FileVo();
		vo.setOriginFile(originFileName);
		vo.setSaveFile(saveFileName);
		vo.setReview_idx(searchReview_idx);
		
		result = dao.insertreviewimg(vo);
		}
	
		return result;
	}
	
}