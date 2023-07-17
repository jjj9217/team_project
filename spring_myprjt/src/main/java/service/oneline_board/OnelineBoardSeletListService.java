package service.oneline_board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OnelineBoardDao;
import vo.OnelineBoardVo;

@Service("obSelectList")
public class OnelineBoardSeletListService implements OnelineBoardService{
	private OnelineBoardDao dao;
	
	@Autowired
	public OnelineBoardSeletListService(OnelineBoardDao dao) {
		this.dao = dao;
	}
	
	public List<OnelineBoardVo> selectList(Map<String, Object> map) {
		return dao.selectList(map);
	}
	
}
