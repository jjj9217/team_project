package service.free_board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardDao;

@Service("fbUpdateReadCount")
public class FreeBoardUpdateReadCountService implements FreeBoardService {
	private FreeBoardDao dao;
	
	@Autowired
	public FreeBoardUpdateReadCountService(FreeBoardDao dao) {
		this.dao = dao;
	}
	
	public void updateReadCount(int board_idx) {
		dao.updateReadCount(board_idx);
	}
	

}
