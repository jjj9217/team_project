package com.crfr.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crfr.vo.FileVo;
import com.crfr.vo.ReviewExploreVo;
import com.crfr.vo.ReviewVo;

@Repository
public class MypageDao {
	public static final String MAPPER = "com.crfr.MypageMapper";
	private SqlSession sqlSession;
	
	public MypageDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//작성하지않은 리뷰 목록에 관한 Dao	
	public List<FileVo> selectmynonreviewListimg(int member_idx) {
				return sqlSession.selectList(MAPPER+".selectmynonreviewListimg", member_idx);
	}
	
	public List<ReviewExploreVo> selectmynonreviewList(int member_idx) {
		return sqlSession.selectList(MAPPER+".selectmynonreviewList", member_idx);
	}
	
	public int selectmynonreviewCount(int member_idx) {
		return sqlSession.selectOne(MAPPER+".selectmynonreviewCount", member_idx);
	}
																	
	
	//작성한 리뷰 목록에 관한 Dao
	public List<FileVo> selectmyreviewListimg(int member_idx) {
		return sqlSession.selectList(MAPPER+".selectmyreviewListimg", member_idx);
	}
	
	public List<ReviewExploreVo> selectmyreviewList(int member_idx) {
	return sqlSession.selectList(MAPPER+".selectmyreviewList", member_idx);
	}
	
	public int selectmyreviewCount(int member_idx) {
	return sqlSession.selectOne(MAPPER+".selectmyreviewCount", member_idx);
	}
	
	//리뷰 작성에 관한 Dao
	//리뷰 내용 작성하기
	public int insertreview(ReviewVo vo) {
	return sqlSession.insert(MAPPER+".insertreview", vo);
	}
	
	//리뷰 번호 조회하기
	public int selectReview_idx(ReviewVo vo) {
		return sqlSession.selectOne(MAPPER+".selectReview_idx", vo);
		}
	
	//리뷰 사진 작성하기	
	public int insertreviewimg(FileVo vo) {
	return sqlSession.insert(MAPPER+".insertreviewimg", vo);
	}

	

	
	
	
	
}