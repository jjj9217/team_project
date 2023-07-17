package service.review_board_reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewBoardReplyDao;
import vo.ReviewBoardReplyVo;

@Service("rbSelectReplyList")
public class ReviewBoardReplySeletReplyListService implements ReviewBoardReplyService{
	private ReviewBoardReplyDao dao;
	
	@Autowired
	public ReviewBoardReplySeletReplyListService(ReviewBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public List<ReviewBoardReplyVo> selectReplyList(int board_idx) {
		return dao.selectReplyList(board_idx);
	}
	
}
