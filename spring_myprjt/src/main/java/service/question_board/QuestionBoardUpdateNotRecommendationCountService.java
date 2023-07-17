package service.question_board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QuestionBoardDao;

@Service("qbUpdateNotRecommendationCount")
public class QuestionBoardUpdateNotRecommendationCountService implements QuestionBoardService {
	private QuestionBoardDao dao;
	
	@Autowired
	public QuestionBoardUpdateNotRecommendationCountService(QuestionBoardDao dao) {
		this.dao = dao;
	}
	
	public void updateNotRecommendationCount(int board_idx) {
		dao.updateNotRecommendationCount(board_idx);
	}
	

}
