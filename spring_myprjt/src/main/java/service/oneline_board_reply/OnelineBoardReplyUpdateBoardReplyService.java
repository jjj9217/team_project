package service.oneline_board_reply;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.OnelineBoardReplyDao;
import vo.OnelineBoardReplyVo;
import vo.OnelineBoardVo;

@Service("obUpdateBoardReply")
public class OnelineBoardReplyUpdateBoardReplyService implements OnelineBoardReplyService {
	private OnelineBoardReplyDao dao;
	
	@Autowired
	public OnelineBoardReplyUpdateBoardReplyService(OnelineBoardReplyDao dao) {
		this.dao = dao;
	}
	
	public int updateBoardReply(int reply_idx, String content, String del_or_not){
				
		OnelineBoardReplyVo vo = new OnelineBoardReplyVo();
		
		//3. 다른 폼의 전달값을 BoardFileVo에 저장하기
		vo.setReply_idx(reply_idx);
		vo.setContent(content);
		vo.setDel_or_not(Integer.parseInt(del_or_not));
		return dao.updateBoardReply(vo);
	}
	

}
