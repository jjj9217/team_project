package service.all_board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import vo.AllBoardReplyVo;
import vo.AllBoardVo;

public interface AllBoardService {
	default int selectCount(Map<String, Object> map) {return 0;}
	default List<AllBoardVo> selectList(Map<String, Object> map) {return null;}
	default int selectMycontentCount(Map<String, Object> map) {return 0;}
	default List<AllBoardVo> selectMycontentList(Map<String, Object> map) {return null;}
	default int selectMyreplyCount(Map<String, Object> map) {return 0;}
	default List<AllBoardReplyVo> selectMyreplyList(Map<String, Object> map) {return null;}
	default int selectReplyCount(Map<String, Object> map) {return 0;}
	default List<AllBoardReplyVo> selectReplyList(Map<String, Object> map) {return null;}
	default AllBoardVo selectView(int all_board_number) {return null;}
	default int deletePost(int all_board_number, HttpServletRequest request) {return 0;}
	default void updateReplyCount(int board_idx) {}
	default int deleteReply(int all_reply_number, HttpServletRequest request) {return 0;}
	default AllBoardReplyVo selectReplyView(int all_reply_number) {return null;}
	
		
}
