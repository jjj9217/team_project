package service.question_board_reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QuestionBoardReplyDao;
import vo.QuestionBoardReplyVo;

@Service("qbSelectReplyList")
public class QuestionBoardReplySeletReplyListService implements QuestionBoardReplyService{
	private QuestionBoardReplyDao dao;
	
	@Autowired
	public QuestionBoardReplySeletReplyListService(QuestionBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public List<QuestionBoardReplyVo> selectReplyList(int board_idx) {
		return dao.selectReplyList(board_idx);
	}
	
}
