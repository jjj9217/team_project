package service.oneline_board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OnelineBoardDao;

@Service("obUpdateReadCount")
public class OnelineBoardUpdateReadCountService implements OnelineBoardService {
	private OnelineBoardDao dao;
	
	@Autowired
	public OnelineBoardUpdateReadCountService(OnelineBoardDao dao) {
		this.dao = dao;
	}
	
	public void updateReadCount(int board_idx) {
		dao.updateReadCount(board_idx);
	}
	

}
