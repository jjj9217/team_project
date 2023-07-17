package service.free_board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardDao;

@Service("fbUpdateRecommendationCount")
public class FreeBoardUpdateRecommendationCountService implements FreeBoardService {
	private FreeBoardDao dao;
	
	@Autowired
	public FreeBoardUpdateRecommendationCountService(FreeBoardDao dao) {
		this.dao = dao;
	}
	
	public void updateRecommendationCount(int board_idx) {
		dao.updateRecommendationCount(board_idx);
	}
	

}
