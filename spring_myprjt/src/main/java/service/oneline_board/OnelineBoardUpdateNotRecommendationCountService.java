package service.oneline_board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OnelineBoardDao;

@Service("obUpdateNotRecommendationCount")
public class OnelineBoardUpdateNotRecommendationCountService implements OnelineBoardService {
	private OnelineBoardDao dao;
	
	@Autowired
	public OnelineBoardUpdateNotRecommendationCountService(OnelineBoardDao dao) {
		this.dao = dao;
	}
	
	public void updateNotRecommendationCount(int board_idx) {
		dao.updateNotRecommendationCount(board_idx);
	}
	

}
