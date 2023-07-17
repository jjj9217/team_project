package service.review_board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewBoardDao;

@Service("rbUpdateNotRecommendationCount")
public class ReviewBoardUpdateNotRecommendationCountService implements ReviewBoardService {
	private ReviewBoardDao dao;
	
	@Autowired
	public ReviewBoardUpdateNotRecommendationCountService(ReviewBoardDao dao) {
		this.dao = dao;
	}
	
	public void updateNotRecommendationCount(int board_idx) {
		dao.updateNotRecommendationCount(board_idx);
	}
	

}
