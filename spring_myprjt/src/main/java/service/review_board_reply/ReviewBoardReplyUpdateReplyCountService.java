package service.review_board_reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewBoardReplyDao;

@Service("rbUpdateReplyCount")
public class ReviewBoardReplyUpdateReplyCountService implements ReviewBoardReplyService {
	private ReviewBoardReplyDao dao;
	
	@Autowired
	public ReviewBoardReplyUpdateReplyCountService(ReviewBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public void updateReplyCount(int board_idx) {
		dao.updateReplyCount(board_idx);
	}
	

}
