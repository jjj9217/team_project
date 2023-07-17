package service.all_board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AllBoardDao;
import vo.AllBoardVo;

@Service("abSelectList")
public class AllBoardSeletListService implements AllBoardService{
	private AllBoardDao dao;
	
	@Autowired
	public AllBoardSeletListService(AllBoardDao dao) {
		this.dao = dao;
	}
	
	public List<AllBoardVo> selectList(Map<String, Object> map) {
		return dao.selectList(map);
	}
	
}
