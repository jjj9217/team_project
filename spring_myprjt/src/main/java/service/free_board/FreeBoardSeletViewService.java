package service.free_board;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardDao;
import dao.MembershipDao;
import vo.FreeBoardVo;
import vo.MembershipVo;

@Service("fbSelectView")
public class FreeBoardSeletViewService implements FreeBoardService{
	private FreeBoardDao dao;
	
	@Autowired
	public FreeBoardSeletViewService(FreeBoardDao dao) {
		this.dao = dao;
	}
	
	public FreeBoardVo selectView(int board_idx) {		
		return dao.selectView(board_idx);
	}
	
}
