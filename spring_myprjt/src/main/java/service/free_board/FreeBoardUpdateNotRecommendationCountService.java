package service.free_board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardDao;

@Service("fbUpdateNotRecommendationCount")
public class FreeBoardUpdateNotRecommendationCountService implements FreeBoardService {
	private FreeBoardDao dao;
	
	@Autowired
	public FreeBoardUpdateNotRecommendationCountService(FreeBoardDao dao) {
		this.dao = dao;
	}
	
	public void updateNotRecommendationCount(int board_idx) {
		dao.updateNotRecommendationCount(board_idx);
	}
	

}
