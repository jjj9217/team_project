package service.all_board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AllBoardDao;

@Service("abSelectReplyCount")
public class AllBoardSeletReplyCountService implements AllBoardService{
	private AllBoardDao dao;
	
	@Autowired
	public AllBoardSeletReplyCountService(AllBoardDao dao) {
		this.dao = dao;
	}
	
	public int selectReplyCount(Map<String, Object> map) {
		
		return dao.selectReplyCount(map);
	}
	
}
