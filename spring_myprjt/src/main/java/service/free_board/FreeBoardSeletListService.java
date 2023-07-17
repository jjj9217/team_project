package service.free_board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardDao;
import vo.FreeBoardVo;

@Service("fbSelectList")
public class FreeBoardSeletListService implements FreeBoardService{
	private FreeBoardDao dao;
	
	@Autowired
	public FreeBoardSeletListService(FreeBoardDao dao) {
		this.dao = dao;
	}
	
	public List<FreeBoardVo> selectList(Map<String, Object> map) {
		return dao.selectList(map);
	}
	
}
