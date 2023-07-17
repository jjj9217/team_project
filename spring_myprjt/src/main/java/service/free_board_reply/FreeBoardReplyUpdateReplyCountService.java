package service.free_board_reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardReplyDao;

@Service("fbUpdateReplyCount")
public class FreeBoardReplyUpdateReplyCountService implements FreeBoardReplyService {
	private FreeBoardReplyDao dao;
	
	@Autowired
	public FreeBoardReplyUpdateReplyCountService(FreeBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public void updateReplyCount(int board_idx) {
		dao.updateReplyCount(board_idx);
	}
	

}
