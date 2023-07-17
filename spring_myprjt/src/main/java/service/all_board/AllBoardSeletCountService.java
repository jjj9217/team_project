package service.all_board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AllBoardDao;

@Service("abSelectCount")
public class AllBoardSeletCountService implements AllBoardService{
	private AllBoardDao dao;
	
	@Autowired
	public AllBoardSeletCountService(AllBoardDao dao) {
		this.dao = dao;
	}
	
	public int selectCount(Map<String, Object> map) {
		
		return dao.selectCount(map);
	}
	
}
