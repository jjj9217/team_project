package service.oneline_board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OnelineBoardDao;

@Service("obSelectCount")
public class OnelineBoardSeletCountService implements OnelineBoardService{
	private OnelineBoardDao dao;
	
	@Autowired
	public OnelineBoardSeletCountService(OnelineBoardDao dao) {
		this.dao = dao;
	}
	
	public int selectCount(Map<String, Object> map) {
		
		return dao.selectCount(map);
	}
	
}
