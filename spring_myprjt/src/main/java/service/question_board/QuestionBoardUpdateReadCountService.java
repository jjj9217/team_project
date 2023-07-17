package service.question_board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QuestionBoardDao;

@Service("qbUpdateReadCount")
public class QuestionBoardUpdateReadCountService implements QuestionBoardService {
	private QuestionBoardDao dao;
	
	@Autowired
	public QuestionBoardUpdateReadCountService(QuestionBoardDao dao) {
		this.dao = dao;
	}
	
	public void updateReadCount(int board_idx) {
		dao.updateReadCount(board_idx);
	}
	

}
