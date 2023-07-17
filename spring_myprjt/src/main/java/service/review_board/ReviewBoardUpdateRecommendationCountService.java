package service.review_board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewBoardDao;

@Service("rbUpdateRecommendationCount")
public class ReviewBoardUpdateRecommendationCountService implements ReviewBoardService {
	private ReviewBoardDao dao;
	
	@Autowired
	public ReviewBoardUpdateRecommendationCountService(ReviewBoardDao dao) {
		this.dao = dao;
	}
	
	public void updateRecommendationCount(int board_idx) {
		dao.updateRecommendationCount(board_idx);
	}
	

}
