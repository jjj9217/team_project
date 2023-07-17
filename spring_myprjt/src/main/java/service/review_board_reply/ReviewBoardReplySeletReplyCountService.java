package service.review_board_reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewBoardReplyDao;

@Service("rbSelectReplyCount")
public class ReviewBoardReplySeletReplyCountService implements ReviewBoardReplyService{
	private ReviewBoardReplyDao dao;
	
	@Autowired
	public ReviewBoardReplySeletReplyCountService(ReviewBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public int selectReplyCount(int board_idx) {
		
		return dao.selectReplyCount(board_idx);
	}
	
}
