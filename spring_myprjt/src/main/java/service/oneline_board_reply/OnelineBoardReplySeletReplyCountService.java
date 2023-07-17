package service.oneline_board_reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OnelineBoardReplyDao;

@Service("obSelectReplyCount")
public class OnelineBoardReplySeletReplyCountService implements OnelineBoardReplyService{
	private OnelineBoardReplyDao dao;
	
	@Autowired
	public OnelineBoardReplySeletReplyCountService(OnelineBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public int selectReplyCount(int board_idx) {
		
		return dao.selectReplyCount(board_idx);
	}
	
}
