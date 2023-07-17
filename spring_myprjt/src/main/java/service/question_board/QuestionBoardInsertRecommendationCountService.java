package service.question_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QuestionBoardDao;
import vo.MembershipVo;

@Service("qbInsertRecommendationCount")
public class QuestionBoardInsertRecommendationCountService implements QuestionBoardService {
	private QuestionBoardDao dao;
	
	@Autowired
	public QuestionBoardInsertRecommendationCountService(QuestionBoardDao dao) {
		this.dao = dao;
	}
	
	public int insertRecommendationCount(int board_idx, HttpServletRequest request){
		
		int result = 0; //삭제 실패시 반환값
		
		HttpSession session = request.getSession();
		
		//로그인 된 회원의 member_idx 얻기
		MembershipVo mVo = (MembershipVo)session.getAttribute("membership");
		int m_idx = mVo.getMember_idx();

		result = dao.insertRecommendationCount(m_idx, board_idx);
		
		return result;
	}
	

}
