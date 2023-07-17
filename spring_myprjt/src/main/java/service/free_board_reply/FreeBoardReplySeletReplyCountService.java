package service.free_board_reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardReplyDao;

@Service("fbSelectReplyCount")
public class FreeBoardReplySeletReplyCountService implements FreeBoardReplyService{
	private FreeBoardReplyDao dao;
	
	@Autowired
	public FreeBoardReplySeletReplyCountService(FreeBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public int selectReplyCount(int board_idx) {
		
		return dao.selectReplyCount(board_idx);
	}
	
}
