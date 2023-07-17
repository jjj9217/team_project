package service.all_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AllBoardDao;
import vo.AllBoardReplyVo;
import vo.MembershipVo;

@Service("abDeleteReply")
public class AllBoardDeleteReplyService implements AllBoardService {
	private AllBoardDao dao;
	
	@Autowired
	public AllBoardDeleteReplyService(AllBoardDao dao) {
		this.dao = dao;
	}
	
	public int deleteReply(int reply_idx, HttpServletRequest request) {
		
		int result = 0; //삭제 실패시 반환값
		
		AllBoardReplyVo vo = dao.selectReplyView(reply_idx);
		HttpSession session = request.getSession();
		
		//로그인 된 회원의 member_idx 얻기
		MembershipVo mVo = (MembershipVo)session.getAttribute("membership");
		int m_idx = mVo.getMember_idx();
		
		if(mVo.getGrade() == 1) {
			result = dao.deleteReply(vo);
		}
		
		return result;
	}
	

}
