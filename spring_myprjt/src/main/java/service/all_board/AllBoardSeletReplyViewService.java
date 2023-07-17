package service.all_board;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AllBoardDao;
import vo.AllBoardReplyVo;
import vo.FreeBoardVo;

@Service("abSelectReplyView")
public class AllBoardSeletReplyViewService implements AllBoardService{
	private AllBoardDao dao;
	
	@Autowired
	public AllBoardSeletReplyViewService(AllBoardDao dao) {
		this.dao = dao;
	}
	
	public AllBoardReplyVo selectReplyView(int all_reply_number) {		
		return dao.selectReplyView(all_reply_number);
	}
	
}
