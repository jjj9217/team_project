package com.crfr.service.seller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.crfr.dao.ProductInsertDao;
import com.crfr.vo.FileVo;
import lombok.RequiredArgsConstructor;

@Service("pInsertFile")
@RequiredArgsConstructor
public class ProductInsertFileService implements ProductSellerService {
	private final ProductInsertDao dao;
	
	public int insertFile (MultipartFile attachedFile,
			String product_idx, HttpServletRequest request) {

		//1. 저장 디렉터리에 저장할 새로운 파일명 만들기
		String originFileName = attachedFile.getOriginalFilename(); //원본 파일 이름
		String ext = originFileName.substring(originFileName.lastIndexOf(".")); //파일 확장자를 추출함
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String saveFileName = now+ext; //새로운 파일이름: 업로드 일시.확장자

		//2. 지정된 경로에 파일 저장하기
		String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
		String fullPath = saveDirectory + saveFileName;
		try {
			attachedFile.transferTo(new File(fullPath));//지정된 경로에 파일 저장
		} catch(IllegalStateException | IOException e) {
			System.out.println("파일 저장 중 예외 발생");
			e.printStackTrace();
		}
		
		//3. 다른 폼의 전달값을 FileVo에 저장하기
		FileVo vo = new FileVo();
		vo.setOriginFile(originFileName);
		vo.setSaveFile(saveFileName);
		vo.setProduct_idx(Integer.parseInt(product_idx));
		
		return dao.insertFile(vo);
	}
}
