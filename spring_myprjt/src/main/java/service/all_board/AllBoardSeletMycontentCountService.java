package service.all_board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AllBoardDao;

@Service("abSelectMycontentCount")
public class AllBoardSeletMycontentCountService implements AllBoardService{
	private AllBoardDao dao;
	
	@Autowired
	public AllBoardSeletMycontentCountService(AllBoardDao dao) {
		this.dao = dao;
	}
	
	public int selectMycontentCount(Map<String, Object> map) {
		
		return dao.selectMycontentCount(map);
	}
	
}
