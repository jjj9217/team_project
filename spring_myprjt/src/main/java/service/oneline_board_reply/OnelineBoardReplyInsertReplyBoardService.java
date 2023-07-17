package service.oneline_board_reply;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OnelineBoardReplyDao;
import vo.OnelineBoardReplyVo;

@Service("obInsertReplyBoard")
public class OnelineBoardReplyInsertReplyBoardService implements OnelineBoardReplyService {
	private OnelineBoardReplyDao dao;
	
	@Autowired
	public OnelineBoardReplyInsertReplyBoardService(OnelineBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public int insertReplyBoard(String board_idx, String member_nickname, 
							String member_idx, String content, String del_or_not){
		
		//폼의 전달값을 BoardFileVo에 저장하기
		OnelineBoardReplyVo vo = new OnelineBoardReplyVo();
		vo.setContent(content);
		vo.setMember_idx(Integer.parseInt(member_idx));
		vo.setMember_nickname(member_nickname);
		vo.setBoard_idx(Integer.parseInt(board_idx));
		vo.setDel_or_not(Integer.parseInt(del_or_not));
		
		return dao.insertReplyBoard(vo);
	}
	

}
