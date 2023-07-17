package service.oneline_board_reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OnelineBoardReplyDao;
import vo.OnelineBoardReplyVo;

@Service("obSelectReplyList")
public class OnelineBoardReplySeletReplyListService implements OnelineBoardReplyService{
	private OnelineBoardReplyDao dao;
	
	@Autowired
	public OnelineBoardReplySeletReplyListService(OnelineBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public List<OnelineBoardReplyVo> selectReplyList(int board_idx) {
		return dao.selectReplyList(board_idx);
	}
	
}
