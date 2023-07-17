package service.free_board_reply;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardReplyDao;
import vo.FreeBoardReplyVo;

@Service("fbInsertReplyBoard")
public class FreeBoardReplyInsertReplyBoardService implements FreeBoardReplyService {
	private FreeBoardReplyDao dao;
	
	@Autowired
	public FreeBoardReplyInsertReplyBoardService(FreeBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public int insertReplyBoard(String board_idx, String member_nickname, 
							String member_idx, String content){
		
		//폼의 전달값을 BoardFileVo에 저장하기
		FreeBoardReplyVo vo = new FreeBoardReplyVo();
		vo.setContent(content);
		vo.setMember_idx(Integer.parseInt(member_idx));
		vo.setMember_nickname(member_nickname);
		vo.setBoard_idx(Integer.parseInt(board_idx));
		
		return dao.insertReplyBoard(vo);
	}
	

}
