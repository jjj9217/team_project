package service.question_board_reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QuestionBoardReplyDao;

@Service("qbUpdateReplyCount")
public class QuestionBoardReplyUpdateReplyCountService implements QuestionBoardReplyService {
	private QuestionBoardReplyDao dao;
	
	@Autowired
	public QuestionBoardReplyUpdateReplyCountService(QuestionBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public void updateReplyCount(int board_idx) {
		dao.updateReplyCount(board_idx);
	}
	

}
