package com.crfr.service.mypage;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.crfr.dao.MypageDao;
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
		
	public int insertreviewimg(List<MultipartFile> attachedFile,
							   HttpServletRequest request, @Param("review_idx")int searchReview_idx) {
		
		String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
		String root = saveDirectory;
		String review_idx = String.valueOf(searchReview_idx);
		
		File fileCheck = new File(root);		
		if(!fileCheck.exists()) fileCheck.mkdirs();
		
		List<Map<String, String>> fileList = new ArrayList<>();		
	
		for(int i = 0; i < attachedFile.size(); i++) {
		//1. 저장 디렉터리에 저장할 새로운 파일명 만들기
		String originFileName = attachedFile.get(i).getOriginalFilename(); //원본 파일 이름
		String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String saveFileName = now+ext;//새로운 파일이름: 업로드 일시.확장자		
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFileName);
			map.put("saveFile", saveFileName);
			map.put("review_idx", review_idx);
			fileList.add(map);		
		}
		
//		String a = fileList.get(0).get("originFile").toString();
		
		//2. 지정된 경로에 파일 저장하기
//		String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
//		String root = saveDirectory;
//		String fullPath = saveDirectory + saveFileName;
		
		
		try {
			for(int i = 0; i < attachedFile.size(); i++) {
				File uploadFile = new File(root + "\\" + fileList.get(i).get("saveFile"));
				attachedFile.get(i).transferTo(uploadFile);
			}
									
		}catch(IllegalStateException | IOException e) {
			System.out.println("파일 저장 중 예외 발생");
			e.printStackTrace();
		}
		
		//다중 파일이니 위 값을 여러번 돌리고, 이 아래에서도 여러번 돌려진 뒤 세팅해서 return값을 넘겨줘야할거같은데
		//3. 다른 폼의 전달값을 BoardFileVo에 저장하기
				
		

		return dao.insertreviewimg(fileList);
	}
	

}
