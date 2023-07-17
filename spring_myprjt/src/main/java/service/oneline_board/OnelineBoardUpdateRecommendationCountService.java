package service.oneline_board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OnelineBoardDao;

@Service("obUpdateRecommendationCount")
public class OnelineBoardUpdateRecommendationCountService implements OnelineBoardService {
	private OnelineBoardDao dao;
	
	@Autowired
	public OnelineBoardUpdateRecommendationCountService(OnelineBoardDao dao) {
		this.dao = dao;
	}
	
	public void updateRecommendationCount(int board_idx) {
		dao.updateRecommendationCount(board_idx);
	}
	

}
