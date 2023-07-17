package service.oneline_board;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OnelineBoardDao;
import dao.MembershipDao;
import vo.OnelineBoardVo;
import vo.MembershipVo;

@Service("obSelectView")
public class OnelineBoardSeletViewService implements OnelineBoardService{
	private OnelineBoardDao dao;
	
	@Autowired
	public OnelineBoardSeletViewService(OnelineBoardDao dao) {
		this.dao = dao;
	}
	
	public OnelineBoardVo selectView(int board_idx) {		
		return dao.selectView(board_idx);
	}
	
}
