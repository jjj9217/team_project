package service.question_board_reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QuestionBoardReplyDao;

@Service("qbSelectReplyCount")
public class QuestionBoardReplySeletReplyCountService implements QuestionBoardReplyService{
	private QuestionBoardReplyDao dao;
	
	@Autowired
	public QuestionBoardReplySeletReplyCountService(QuestionBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public int selectReplyCount(int board_idx) {
		
		return dao.selectReplyCount(board_idx);
	}
	
}
