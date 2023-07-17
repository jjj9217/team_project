package service.review_board_reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewBoardDao;
import dao.ReviewBoardReplyDao;
import vo.ReviewBoardReplyVo;
import vo.ReviewBoardVo;
import vo.MembershipVo;

@Service("rbDeleteReply")
public class ReviewBoardReplyDeleteReplyService implements ReviewBoardReplyService {
	private ReviewBoardReplyDao dao;
	
	@Autowired
	public ReviewBoardReplyDeleteReplyService(ReviewBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public int deleteReply(int reply_idx, HttpServletRequest request) {
		
		int result = 0; //삭제 실패시 반환값
		
		ReviewBoardReplyVo vo = dao.selectReplyView(reply_idx);
		HttpSession session = request.getSession();
		
		//로그인 된 회원의 member_idx 얻기
		MembershipVo mVo = (MembershipVo)session.getAttribute("membership");
		int m_idx = mVo.getMember_idx();
		
		if(m_idx == vo.getMember_idx() || mVo.getGrade() == 1) {
			result = dao.deleteReply(vo);
		}
		
		return result;
	}
	

}
