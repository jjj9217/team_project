package com.crfr.service.oneInq;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.crfr.dao.OneInqDao;
import com.crfr.vo.FileVo;
import com.crfr.vo.OneInqVo;

import lombok.RequiredArgsConstructor;

@Service("oInsertOneinq")
@RequiredArgsConstructor
public class OneinqInsertService implements OneInqService {
	private final OneInqDao dao;
	
	public int insertOneinq(OneInqVo vo) {
		return dao.insertOneinq(vo);}
	
	public int selectOneinq_idx(OneInqVo vo) {
		return dao.selectOneinq_idx(vo);}
	
	
	public int insertOneinqimg (MultipartFile attachedFile,
			int selectOneinq_idx , HttpServletRequest request) {

		//1. 저장 디렉터리에 저장할 새로운 파일명 만들기
		String originFileName = attachedFile.getOriginalFilename(); //원본 파일 이름
		String saveFileName = null;
		if(!originFileName.equals("")) {
			String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			saveFileName = now+ext;//새로운 파일이름: 업로드 일시.확장자	
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
		FileVo vo = new FileVo();		
		vo.setOriginFile(originFileName);
		vo.setSaveFile(saveFileName);
		vo.setOne_inq_idx(selectOneinq_idx);				
		return dao.insertOneinqimg(vo);
		
	}
	
}
