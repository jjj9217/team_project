package service.all_board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AllBoardDao;
import dao.FreeBoardDao;
import dao.FreeBoardReplyDao;
import dao.OnelineBoardDao;
import dao.OnelineBoardReplyDao;
import dao.QuestionBoardDao;
import dao.QuestionBoardReplyDao;
import dao.ReviewBoardDao;
import dao.ReviewBoardReplyDao;
import vo.AllBoardVo;
import vo.FreeBoardReplyVo;
import vo.MembershipVo;
import vo.OnelineBoardReplyVo;
import vo.QuestionBoardReplyVo;
import vo.ReviewBoardReplyVo;

@Service("abDelete")
public class AllBoardDeleteService implements AllBoardService {
	private AllBoardDao abDao;
	
	private FreeBoardDao fbDao1;
	private FreeBoardReplyDao fbDao2;
	
	private QuestionBoardDao qbDao1;
	private QuestionBoardReplyDao qbDao2;
	
	private ReviewBoardDao rbDao1;
	private ReviewBoardReplyDao rbDao2;
	
	private OnelineBoardDao obDao1;
	private OnelineBoardReplyDao obDao2;
	@Autowired
	public AllBoardDeleteService(AllBoardDao abDao, FreeBoardDao fbDao1, FreeBoardReplyDao fbDao2, 
			QuestionBoardDao qbDao1, QuestionBoardReplyDao qbDao2,
			ReviewBoardDao rbDao1, ReviewBoardReplyDao rbDao2,
			OnelineBoardDao obDao1, OnelineBoardReplyDao obDao2) {
		this.abDao = abDao;
		
		this.fbDao1 = fbDao1;
		this.fbDao2 = fbDao2;
		
		this.qbDao1 = qbDao1;
		this.qbDao2 = qbDao2;
		
		this.rbDao1 = rbDao1;
		this.rbDao2 = rbDao2;
		
		this.obDao1 = obDao1;
		this.obDao2 = obDao2;
		
	}
	
	public int deletePost(int all_board_number, HttpServletRequest request) {
		
		int result = 0; //삭제 실패시 반환값
				
		AllBoardVo vo = abDao.selectView(all_board_number);
		
		int board_idx = vo.getBoard_idx();
		String board_initial = vo.getBoard_initial();

		HttpSession session = request.getSession();		
		//로그인 된 회원의 member_idx 얻기
		MembershipVo mVo = (MembershipVo)session.getAttribute("membership");
		int m_idx = mVo.getMember_idx();
		
		if(mVo.getGrade() == 1) {
			
			if(board_initial.equals("F")){
				List<FreeBoardReplyVo> boardReplyList = fbDao2.selectReplyList(board_idx);
				for(FreeBoardReplyVo vo2 : boardReplyList) { 
					int result2 = fbDao2.deleteReply(vo2);
					fbDao2.updateReplyCount(vo2.getBoard_idx());
				}
				fbDao1.deleteRecommendation(board_idx);
			}else if(board_initial.equals("Q")){
				List<QuestionBoardReplyVo> boardReplyList = qbDao2.selectReplyList(board_idx);
				for(QuestionBoardReplyVo vo2 : boardReplyList) { 
					int result2 = qbDao2.deleteReply(vo2);
					qbDao2.updateReplyCount(vo2.getBoard_idx());
				}
				qbDao1.deleteRecommendation(board_idx);
			}else if(board_initial.equals("R")){
				List<ReviewBoardReplyVo> boardReplyList = rbDao2.selectReplyList(board_idx);
				for(ReviewBoardReplyVo vo2 : boardReplyList) { 
					int result2 = rbDao2.deleteReply(vo2);
					rbDao2.updateReplyCount(vo2.getBoard_idx());
				}
				rbDao1.deleteRecommendation(board_idx);
			}else if(board_initial.equals("O")){
				List<OnelineBoardReplyVo> boardReplyList = obDao2.selectReplyList(board_idx);
				for(OnelineBoardReplyVo vo2 : boardReplyList) { 
					int result2 = obDao2.deleteReply(vo2);
					obDao2.updateReplyCount(vo2.getBoard_idx());
				}
				obDao1.deleteRecommendation(board_idx);
			}
			
			result = abDao.deletePost(vo);
		}
		
		return result;
	}
	

}
