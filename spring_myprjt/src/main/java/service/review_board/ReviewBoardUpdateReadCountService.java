package service.review_board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewBoardDao;

@Service("rbUpdateReadCount")
public class ReviewBoardUpdateReadCountService implements ReviewBoardService {
	private ReviewBoardDao dao;
	
	@Autowired
	public ReviewBoardUpdateReadCountService(ReviewBoardDao dao) {
		this.dao = dao;
	}
	
	public void updateReadCount(int board_idx) {
		dao.updateReadCount(board_idx);
	}
	

}
