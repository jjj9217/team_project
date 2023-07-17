package service.review_board_reply;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewBoardReplyDao;
import vo.ReviewBoardReplyVo;

@Service("rbInsertReplyBoard")
public class ReviewBoardReplyInsertReplyBoardService implements ReviewBoardReplyService {
	private ReviewBoardReplyDao dao;
	
	@Autowired
	public ReviewBoardReplyInsertReplyBoardService(ReviewBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public int insertReplyBoard(String board_idx, String member_nickname, 
							String member_idx, String content){
		
		//폼의 전달값을 BoardFileVo에 저장하기
		ReviewBoardReplyVo vo = new ReviewBoardReplyVo();
		vo.setContent(content);
		vo.setMember_idx(Integer.parseInt(member_idx));
		vo.setMember_nickname(member_nickname);
		vo.setBoard_idx(Integer.parseInt(board_idx));
		
		return dao.insertReplyBoard(vo);
	}
	

}
