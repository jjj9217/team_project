package service.question_board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QuestionBoardDao;
import vo.QuestionBoardVo;

@Service("qbSelectList")
public class QuestionBoardSeletListService implements QuestionBoardService{
	private QuestionBoardDao dao;
	
	@Autowired
	public QuestionBoardSeletListService(QuestionBoardDao dao) {
		this.dao = dao;
	}
	
	public List<QuestionBoardVo> selectList(Map<String, Object> map) {
		return dao.selectList(map);
	}
	
}
