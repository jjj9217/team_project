package service.all_board;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AllBoardDao;
import vo.AllBoardVo;

@Service("abSelectView")
public class AllBoardSeletViewService implements AllBoardService{
	private AllBoardDao dao;
	
	@Autowired
	public AllBoardSeletViewService(AllBoardDao dao) {
		this.dao = dao;
	}
	
	public AllBoardVo selectView(int all_board_number) {		
		return dao.selectView(all_board_number);
	}
	
}
