package service.oneline_board_reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OnelineBoardReplyDao;

@Service("obUpdateReplyCount")
public class OnelineBoardReplyUpdateReplyCountService implements OnelineBoardReplyService {
	private OnelineBoardReplyDao dao;
	
	@Autowired
	public OnelineBoardReplyUpdateReplyCountService(OnelineBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public void updateReplyCount(int board_idx) {
		dao.updateReplyCount(board_idx);
	}
	

}
