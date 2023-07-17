package service.free_board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.FreeBoardDao;
import vo.FreeBoardVo;

@Service("fbInsertBoard")
public class FreeBoardInsertBoardService implements FreeBoardService {
	private FreeBoardDao dao;
	
	@Autowired
	public FreeBoardInsertBoardService(FreeBoardDao dao) {
		this.dao = dao;
	}
	
	public int insertBoard(MultipartFile attachedFile,
			String member_nickname, String member_idx, String title, String content,
			HttpServletRequest request){
		
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
		
		//3. 다른 폼의 전달값을 BoardFileVo에 저장하기
		FreeBoardVo vo = new FreeBoardVo();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setOriginFile(originFileName);
		vo.setSaveFile(saveFileName);
		vo.setMember_idx(Integer.parseInt(member_idx));
		vo.setMember_nickname(member_nickname);
		
		return dao.insertBoard(vo);
	}
	

}
