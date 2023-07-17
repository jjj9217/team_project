package service.all_board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AllBoardDao;
import vo.AllBoardReplyVo;

@Service("abSelectMyreplyList")
public class AllBoardSeletMyreplyListService implements AllBoardService{
	private AllBoardDao dao;
	
	@Autowired
	public AllBoardSeletMyreplyListService(AllBoardDao dao) {
		this.dao = dao;
	}
	
	public List<AllBoardReplyVo> selectMyreplyList(Map<String, Object> map) {
		return dao.selectMyreplyList(map);
	}
	
}
