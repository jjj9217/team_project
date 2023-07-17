package service.question_board_reply;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.QuestionBoardReplyDao;
import vo.QuestionBoardReplyVo;
import vo.QuestionBoardVo;

@Service("qbUpdateBoardReply")
public class QuestionBoardReplyUpdateBoardReplyService implements QuestionBoardReplyService {
	private QuestionBoardReplyDao dao;
	
	@Autowired
	public QuestionBoardReplyUpdateBoardReplyService(QuestionBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public int updateBoardReply(int reply_idx, String content){
				
		QuestionBoardReplyVo vo = new QuestionBoardReplyVo();
		
		//3. 다른 폼의 전달값을 BoardFileVo에 저장하기
		vo.setReply_idx(reply_idx);
		vo.setContent(content);
		
		return dao.updateBoardReply(vo);
	}
	

}
