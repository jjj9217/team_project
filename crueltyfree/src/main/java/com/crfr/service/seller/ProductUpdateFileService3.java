package com.crfr.service.seller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.FileVo;

import lombok.RequiredArgsConstructor;

@Service("pUpdateProductFile3")
@RequiredArgsConstructor
public class ProductUpdateFileService3 implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public int productUpdateFile3(MultipartFile attachedFile3,
			String file_idx, HttpServletRequest request) {
		
			int result = 0;
			if(!attachedFile3.isEmpty()) {
				//1. 저장 디렉터리에 저장할 새로운 파일명 만들기
				String originFileName = attachedFile3.getOriginalFilename(); //원본 파일 이름
				
				FileVo vo = new FileVo();
				
				if(originFileName.length() != 0) {//새로운 파일을 선택한 경우
					String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
					String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
					String saveFileName = now+ext;//새로운 파일이름: 업로드 일시.확장자
					
					//2. 지정된 경로에 파일 저장하기
					String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
					String fullPath = saveDirectory + saveFileName;
					try {
						attachedFile3.transferTo(new File(fullPath));//지정된 경로에 파일 저장
					}catch(IllegalStateException | IOException e) {
						System.out.println("파일 저장 중 예외 발생");
						e.printStackTrace();
					}
					
					vo.setOriginFile(originFileName);
					vo.setSaveFile(saveFileName);
					vo.setFile_idx(Integer.parseInt(file_idx));
				}
				
				result = dao.productUpdateFile3(vo);
			}
			
			return result;
	}
}
