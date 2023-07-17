package service.oneline_board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import vo.OnelineBoardVo;

public interface OnelineBoardService {
	default int selectCount(Map<String, Object> map) {return 0;}
	default List<OnelineBoardVo> selectList(Map<String, Object> map) {return null;}
	default OnelineBoardVo selectView(int board_idx) {return null;}
	default void updateReadCount(int board_idx) {}
	default int insertBoard(MultipartFile attachedFile,
			String member_nickname, String member_idx, String title, String content,
			HttpServletRequest request){return 0;}
	default int updateBoard(MultipartFile attachedFile,
			int board_idx, String title, String content, 
			HttpServletRequest request){return 0;}
	default void download(String originFileName, String saveFileName,
			HttpServletRequest request, HttpServletResponse response) {}
	default int deletePost(int board_idx, HttpServletRequest request) {return 0;}
	default int recommendationCount(int board_idx, HttpServletRequest request) {return 0;}
	default int insertRecommendationCount(int board_idx, HttpServletRequest request) {return 0;}
	default void updateRecommendationCount(int board_idx) {}
	default void updateNotRecommendationCount(int board_idx) {}
}
