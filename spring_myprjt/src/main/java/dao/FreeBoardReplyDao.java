package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.DBConnectionPool;
import vo.FreeBoardReplyVo;
import vo.FreeBoardVo;

@Repository
public class FreeBoardReplyDao{

	public static final String MAPPER = "FreeBoardReplyMapper";
	SqlSession sqlSession;
	
	@Autowired
	public FreeBoardReplyDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public int insertReplyBoard(FreeBoardReplyVo vo) {
		return sqlSession.insert(MAPPER+".insertReplyBoard",vo);
	}
	
	public int selectReplyCount(int board_idx) {
		return sqlSession.selectOne(MAPPER+".selectReplyCount",board_idx);
	}
	
	public List<FreeBoardReplyVo> selectReplyList(int board_idx) {
		return sqlSession.selectList(MAPPER+".selectReplyList",board_idx);
	}
	
	//댓글 작성시 댓글수 업데이트
	public void updateReplyCount(int board_idx) {
		sqlSession.update(MAPPER+".updateReplyCount", board_idx);
	}
	
	//댓글수정
	public int updateBoardReply(FreeBoardReplyVo vo) {
		return sqlSession.update(MAPPER+".updateBoardReply", vo);
	}
	
	//지정댓글
	public FreeBoardReplyVo selectReplyView(int reply_idx) {
		return sqlSession.selectOne(MAPPER+".selectReplyView", reply_idx);
	}
	
	//댓글삭제
	public int deleteReply(FreeBoardReplyVo vo) {
		int reply_idx = vo.getReply_idx();
		return sqlSession.delete(MAPPER+".deleteReply",reply_idx);
	}
	
}
