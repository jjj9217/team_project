package service.free_board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardDao;

@Service("fbSelectCount")
public class FreeBoardSeletCountService implements FreeBoardService{
	private FreeBoardDao dao;
	
	@Autowired
	public FreeBoardSeletCountService(FreeBoardDao dao) {
		this.dao = dao;
	}
	
	public int selectCount(Map<String, Object> map) {
		
		return dao.selectCount(map);
	}
	
}
