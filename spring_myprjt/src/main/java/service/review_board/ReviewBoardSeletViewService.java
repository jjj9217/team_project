package service.review_board;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewBoardDao;
import dao.MembershipDao;
import vo.ReviewBoardVo;
import vo.MembershipVo;

@Service("rbSelectView")
public class ReviewBoardSeletViewService implements ReviewBoardService{
	private ReviewBoardDao dao;
	
	@Autowired
	public ReviewBoardSeletViewService(ReviewBoardDao dao) {
		this.dao = dao;
	}
	
	public ReviewBoardVo selectView(int board_idx) {		
		return dao.selectView(board_idx);
	}
	
}
