package service.question_board;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QuestionBoardDao;
import dao.MembershipDao;
import vo.QuestionBoardVo;
import vo.MembershipVo;

@Service("qbSelectView")
public class QuestionBoardSeletViewService implements QuestionBoardService{
	private QuestionBoardDao dao;
	
	@Autowired
	public QuestionBoardSeletViewService(QuestionBoardDao dao) {
		this.dao = dao;
	}
	
	public QuestionBoardVo selectView(int board_idx) {		
		return dao.selectView(board_idx);
	}
	
}
