package service.review_board_reply;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.ReviewBoardReplyDao;
import vo.ReviewBoardReplyVo;
import vo.ReviewBoardVo;

@Service("rbUpdateBoardReply")
public class ReviewBoardReplyUpdateBoardReplyService implements ReviewBoardReplyService {
	private ReviewBoardReplyDao dao;
	
	@Autowired
	public ReviewBoardReplyUpdateBoardReplyService(ReviewBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public int updateBoardReply(int reply_idx, String content){
				
		ReviewBoardReplyVo vo = new ReviewBoardReplyVo();
		
		//3. 다른 폼의 전달값을 BoardFileVo에 저장하기
		vo.setReply_idx(reply_idx);
		vo.setContent(content);
		
		return dao.updateBoardReply(vo);
	}
	

}
