package service.review_board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewBoardDao;
import vo.ReviewBoardVo;

@Service("rbSelectList")
public class ReviewBoardSeletListService implements ReviewBoardService{
	private ReviewBoardDao dao;
	
	@Autowired
	public ReviewBoardSeletListService(ReviewBoardDao dao) {
		this.dao = dao;
	}
	
	public List<ReviewBoardVo> selectList(Map<String, Object> map) {
		return dao.selectList(map);
	}
	
}
