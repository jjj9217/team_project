package service.all_board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AllBoardDao;
import dao.FreeBoardReplyDao;

@Service("abUpdateReplyCount")
public class AllBoardUpdateReplyCountService implements AllBoardService {
	private AllBoardDao dao;
	
	@Autowired
	public AllBoardUpdateReplyCountService(AllBoardDao dao) {
		this.dao = dao;
	}
	
	public void updateReplyCount(int board_idx) {
		dao.updateReplyCount(board_idx);
	}
	

}
