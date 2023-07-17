package service.oneline_board_reply;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import vo.OnelineBoardReplyVo;
import vo.OnelineBoardVo;

public interface OnelineBoardReplyService {
	default List<OnelineBoardReplyVo> selectReplyList(int board_idx) {return null;}
	default int selectReplyCount(int board_idx) {return 0;}
	default int insertReplyBoard(String board_idx, String member_nickname, 
							String member_idx, String content, String del_or_not) {return 0;}
	default void updateReplyCount(int board_idx) {}
	default int updateBoardReply(int reply_idx, String content, String del_or_not) {return 0;}
	default int deleteReply(int reply_idx, HttpServletRequest request) {return 0;}
	
}
