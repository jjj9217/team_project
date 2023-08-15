package com.crfr.service.oneInq;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.crfr.dao.OneInqDao;
import com.crfr.vo.NoticeVo;
import com.crfr.vo.OneInqVo;

@Service("UpdateNotice")
public class NoticeUpdateService implements OneInqService {
	private OneInqDao dao;
	
	@Autowired
	public NoticeUpdateService(OneInqDao dao) {
		this.dao = dao;
	}
	
	//해당 공지사항 수정
	public int updatenotice(MultipartFile attachedFile, NoticeVo vo, HttpServletRequest request) {
		
		System.out.println("일단 여기까진 오나?");
		String originFileName = attachedFile.getOriginalFilename(); //원본 파일 이름
		System.out.println("originFileName 들어갔나?:"+originFileName);
		String saveFileName = null;
		if(!originFileName.equals("")) {
			String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			saveFileName = now+ext;//새로운 파일이름: 업로드 일시.확장자
			System.out.println("thats 안으로도 들어갔나?");
		}

		//2. 지정된 경로에 파일 저장하기
		String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
		String fullPath = saveDirectory + saveFileName;
		try {
			attachedFile.transferTo(new File(fullPath)); //지정된 경로에 파일 저장		
		}catch(IllegalStateException | IOException e) {
			e.printStackTrace();
		}		
		
			
		//3. 다른 폼의 전달값을 FileVo에 저장하기
		NoticeVo vo2 = new NoticeVo();
		vo2.setNotice_idx(vo.getNotice_idx());
		vo2.setNotice_title(vo.getNotice_title());
		vo2.setNotice_content(vo.getNotice_title());
		
		System.out.println("겟노티스타이틀"+vo.getNotice_title());
		vo2.setNotice_originFile(originFileName);
		vo2.setNotice_saveFile(saveFileName);
		System.out.println("겟오리진파일:"+ vo.getNotice_originFile());
		System.out.println("겟세이브파일:"+ vo.getNotice_saveFile());
		
		return dao.updatenotice(vo2);
	}
	
	//1:1문의 수정하기
	public int updateoneinq (OneInqVo vo) {
		return dao.updateoneinq(vo);
	}
	
}
