package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.DBConnectionPool;
import vo.QuestionBoardVo;

@Repository
public class QuestionBoardDao{
	
	public static final String MAPPER = "QuestionBoardMapper";
	SqlSession sqlSession;
	
	@Autowired
	public QuestionBoardDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}	
	
	public int insertBoard(QuestionBoardVo vo) {
		return sqlSession.insert(MAPPER+".insertBoard",vo);
	}

	//검색 조건에 맞는 게시물 수를 반환하는 메소드
	public int selectCount(Map<String, Object> map) {
		return sqlSession.selectOne(MAPPER+".selectCount",map);
	}
	
	//검색 조건에 맞는 게시물 목록을 반환하는 메소드
	public List<QuestionBoardVo> selectList(Map<String, Object> map) {
		return sqlSession.selectList(MAPPER+".selectList",map);
		
	}
	
	//조회수 증가시키는 메소드
	public void updateReadCount(int board_idx) {
		sqlSession.update(MAPPER+".updateReadCount",board_idx);		
	}

	//지정한 게시물을 찾아 내용을 반환하는 메소드
	public QuestionBoardVo selectView(int board_idx) {
		return sqlSession.selectOne(MAPPER+".selectView",board_idx);
	}
	
	//지정한 게시물의 내용을 수정하는 메소드
	public int updateBoard(QuestionBoardVo vo) {
		return sqlSession.update(MAPPER+".updateBoard", vo);
	}
	
	public int deletePost(QuestionBoardVo vo) {
		int board_idx = vo.getBoard_idx();
		return sqlSession.delete(MAPPER+".deletePost",board_idx);
	}
	
	//추천수체크
	public int recommendationCount(int member_idx, int board_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_idx", member_idx);
		map.put("board_idx", board_idx);
		return sqlSession.selectOne(MAPPER+".recommendationCount", map);
	}
	//추천테이블에 정보등록
	public int insertRecommendationCount(int member_idx, int board_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_idx", member_idx);
		map.put("board_idx", board_idx);
		return sqlSession.insert(MAPPER+".insertRecommendationCount",map);
	}
	//추천수업데이트	
	public void updateRecommendationCount(int board_idx) {
		sqlSession.update(MAPPER+".updateRecommendationCount",board_idx);	
	}
	
	//비추천수업데이트	
	public void updateNotRecommendationCount(int board_idx) {
		sqlSession.update(MAPPER+".updateNotRecommendationCount",board_idx);
	}
	
	//추천테이블컬럼삭제
	public int deleteRecommendation(int board_idx) {
		return sqlSession.delete(MAPPER+".deleteRecommendation",board_idx);
	}
}
