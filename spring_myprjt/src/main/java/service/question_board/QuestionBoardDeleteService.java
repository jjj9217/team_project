package service.question_board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QuestionBoardDao;
import dao.QuestionBoardReplyDao;
import vo.FreeBoardReplyVo;
import vo.MembershipVo;
import vo.QuestionBoardReplyVo;
import vo.QuestionBoardVo;

@Service("qbDelete")
public class QuestionBoardDeleteService implements QuestionBoardService {
	private QuestionBoardDao dao;
	private QuestionBoardReplyDao dao2;
	
	@Autowired
	public QuestionBoardDeleteService(QuestionBoardDao dao, QuestionBoardReplyDao dao2) {
		this.dao = dao;
		this.dao2 = dao2;
	}
	
	public int deletePost(int board_idx, HttpServletRequest request) {
		
		int result = 0; //삭제 실패시 반환값
		
		List<QuestionBoardReplyVo> boardReplyList = dao2.selectReplyList(board_idx);//댓글 목록
		
		QuestionBoardVo vo = dao.selectView(board_idx);
		HttpSession session = request.getSession();
		
		//로그인 된 회원의 member_idx 얻기
		MembershipVo mVo = (MembershipVo)session.getAttribute("membership");
		int m_idx = mVo.getMember_idx();
		
		if(m_idx == vo.getMember_idx() || mVo.getGrade() == 1) {
			
			for(QuestionBoardReplyVo vo2 : boardReplyList) { //얻어온 vo로 해당 board_idx가진 댓글 모두 삭제
				int result2 = dao2.deleteReply(vo2);
				dao2.updateReplyCount(vo2.getBoard_idx());
			}
			dao.deleteRecommendation(board_idx);
			result = dao.deletePost(vo);
		}
		
		return result;
	}
	

}
