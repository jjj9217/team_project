package service.question_board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QuestionBoardDao;

@Service("qbUpdateRecommendationCount")
public class QuestionBoardUpdateRecommendationCountService implements QuestionBoardService {
	private QuestionBoardDao dao;
	
	@Autowired
	public QuestionBoardUpdateRecommendationCountService(QuestionBoardDao dao) {
		this.dao = dao;
	}
	
	public void updateRecommendationCount(int board_idx) {
		dao.updateRecommendationCount(board_idx);
	}
	

}
