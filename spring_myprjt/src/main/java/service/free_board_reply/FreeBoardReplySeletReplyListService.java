package service.free_board_reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardReplyDao;
import vo.FreeBoardReplyVo;

@Service("fbSelectReplyList")
public class FreeBoardReplySeletReplyListService implements FreeBoardReplyService{
	private FreeBoardReplyDao dao;
	
	@Autowired
	public FreeBoardReplySeletReplyListService(FreeBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public List<FreeBoardReplyVo> selectReplyList(int board_idx) {
		return dao.selectReplyList(board_idx);
	}
	
}
