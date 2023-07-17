package service.all_board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AllBoardDao;

@Service("abSelectMyreplyCount")
public class AllBoardSeletMyreplyCountService implements AllBoardService{
	private AllBoardDao dao;
	
	@Autowired
	public AllBoardSeletMyreplyCountService(AllBoardDao dao) {
		this.dao = dao;
	}
	
	public int selectMyreplyCount(Map<String, Object> map) {
		
		return dao.selectMyreplyCount(map);
	}
	
}
