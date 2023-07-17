package service.free_board_reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardDao;
import dao.FreeBoardReplyDao;
import vo.FreeBoardReplyVo;
import vo.FreeBoardVo;
import vo.MembershipVo;

@Service("fbDeleteReply")
public class FreeBoardReplyDeleteReplyService implements FreeBoardReplyService {
	private FreeBoardReplyDao dao;
	
	@Autowired
	public FreeBoardReplyDeleteReplyService(FreeBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public int deleteReply(int reply_idx, HttpServletRequest request) {
		
		int result = 0; //삭제 실패시 반환값
		
		FreeBoardReplyVo vo = dao.selectReplyView(reply_idx);
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
