package service.question_board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.QuestionBoardDao;
import vo.QuestionBoardVo;

@Service("qbUpdateBoard")
public class QuestionBoardUpdateBoardService implements QuestionBoardService {
	private QuestionBoardDao dao;
	
	@Autowired
	public QuestionBoardUpdateBoardService(QuestionBoardDao dao) {
		this.dao = dao;
	}
	
	public int updateBoard(MultipartFile attachedFile,
			int board_idx, String title, String content, 
			HttpServletRequest request){
		
		//1. 저장 디렉터리에 저장할 새로운 파일명 만들기
		String originFileName = attachedFile.getOriginalFilename(); //원본 파일 이름
		
		QuestionBoardVo vo = new QuestionBoardVo();
		
		if(originFileName.length() != 0) {//새로운 파일을 선택한 경우
			String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String saveFileName = now+ext;//새로운 파일이름: 업로드 일시.확장자
			
			//2. 지정된 경로에 파일 저장하기
			String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
			String fullPath = saveDirectory + saveFileName;
			try {
				attachedFile.transferTo(new File(fullPath)); //지정된 경로에 파일 저장		
			}catch(IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			vo.setOriginFile(originFileName);
			vo.setSaveFile(saveFileName);			
		}
		
		//3. 다른 폼의 전달값을 BoardFileVo에 저장하기
		vo.setTitle(title);
		vo.setContent(content);
		vo.setBoard_idx(board_idx);
		
		return dao.updateBoard(vo);
	}
	

}
