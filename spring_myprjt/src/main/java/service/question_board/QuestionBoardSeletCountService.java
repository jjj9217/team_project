package service.question_board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QuestionBoardDao;

@Service("qbSelectCount")
public class QuestionBoardSeletCountService implements QuestionBoardService{
	private QuestionBoardDao dao;
	
	@Autowired
	public QuestionBoardSeletCountService(QuestionBoardDao dao) {
		this.dao = dao;
	}
	
	public int selectCount(Map<String, Object> map) {
		
		return dao.selectCount(map);
	}
	
}
