package service.all_board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AllBoardDao;
import vo.AllBoardVo;

@Service("abSelectMycontentList")
public class AllBoardSeletMycontentListService implements AllBoardService{
	private AllBoardDao dao;
	
	@Autowired
	public AllBoardSeletMycontentListService(AllBoardDao dao) {
		this.dao = dao;
	}
	
	public List<AllBoardVo> selectMycontentList(Map<String, Object> map) {
		return dao.selectMycontentList(map);
	}
	
}
