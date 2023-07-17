package service.all_board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AllBoardDao;
import vo.AllBoardReplyVo;

@Service("abSelectReplyList")
public class AllBoardSeletReplyListService implements AllBoardService{
	private AllBoardDao dao;
	
	@Autowired
	public AllBoardSeletReplyListService(AllBoardDao dao) {
		this.dao = dao;
	}
	
	public List<AllBoardReplyVo> selectReplyList(Map<String, Object> map) {
		return dao.selectReplyList(map);
	}
	
}
