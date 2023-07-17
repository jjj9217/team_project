package service.review_board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewBoardDao;

@Service("rbSelectCount")
public class ReviewBoardSeletCountService implements ReviewBoardService{
	private ReviewBoardDao dao;
	
	@Autowired
	public ReviewBoardSeletCountService(ReviewBoardDao dao) {
		this.dao = dao;
	}
	
	public int selectCount(Map<String, Object> map) {
		
		return dao.selectCount(map);
	}
	
}
