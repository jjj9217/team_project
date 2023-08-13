package com.crfr.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crfr.vo.DeliveryVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.LikeExploreVo;
import com.crfr.vo.MemberVo;
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

	
	
	//배송지에 관한 Dao
	
	//배송지 목록에 관한 Dao
	public List<DeliveryVo> selectdeliveryList(int member_idx) {
	return sqlSession.selectList(MAPPER+".selectdeliveryList", member_idx);
	}
	
	//배송지 개수세기
	public int selectdeliveryCount(int member_idx) {
		return sqlSession.selectOne(MAPPER+".selectdeliveryCount", member_idx);
	}
	
	//기본배송지 등록하기
	public int insertdeliveryPost(DeliveryVo vo) {
		return sqlSession.insert(MAPPER+".insertdeliveryPost", vo);
	}
	
	//노말배송지 등록하기
	public int insertdeliveryPost_normal(DeliveryVo vo) {
		return sqlSession.insert(MAPPER+".insertdeliveryPost_normal", vo);
	}

	//기본배송지 설정하기
	public int updatedeliveryPostdefault (DeliveryVo vo) {
		return sqlSession.update(MAPPER+".updatedeliveryPostdefault", vo);
	}
	
	public int updatedeliveryPostchangedefault(DeliveryVo vo) {
		return sqlSession.update(MAPPER+".updatedeliveryPostchangedefault", vo);
	}
	
	//수정할 배송지번호 페이지 보여주기
	public DeliveryVo selectVieweditdelivery(int delivery_idx) {		
		return sqlSession.selectOne(MAPPER+".selectVieweditdelivery", delivery_idx);
	} 
	
	//배송지 수정하기
	public int updatedeliveryPost(DeliveryVo vo) {
		return sqlSession.update(MAPPER+".updatedeliveryPost", vo);
	}
	
	//배송지 삭제하기
	public int deletedeliveryPost(DeliveryVo vo) {
		return sqlSession.delete(MAPPER+".deletedeliveryPost", vo);
	}
	
	//회원정보 비밀번호 변경하기
	public int changepassword(MemberVo vo) {
		return sqlSession.update(MAPPER+".changepassword", vo);
	}
	
	//좋아요 사진 목록에 관한 Dao	
	public List<FileVo> selectlikeListimg(int member_idx) {
				return sqlSession.selectList(MAPPER+".selectlikeListimg", member_idx);
	}

	//좋아요 목록에 관한Dao
	public List<LikeExploreVo> selectlikeList(int member_idx) {
		return sqlSession.selectList(MAPPER+".selectlikeList", member_idx);
	}
	
	//좋아요 목록 개수세기에 관한Dao
	public int selectlikeListCount(int member_idx) {
		return sqlSession.selectOne(MAPPER+".selectlikeListCount", member_idx);
	}
	
	//좋아요 삭제하기
	public int deletelike(LikeExploreVo vo) {
		return sqlSession.delete(MAPPER+".deletelike", vo);
	}
	
	//좋아요 전체 삭제하기
	public int deletelikeall(LikeExploreVo vo) {
		return sqlSession.delete(MAPPER+".deletelikeall", vo);
	}
	
	//작성한 리뷰 사진목록에 관한 Dao
	public List<FileVo> reviewRegList(FileVo vo) {
	return sqlSession.selectList(MAPPER+".reviewRegList", vo);
	}
	
	//작성한 리뷰내용 수정하기
	public int updatereview(ReviewVo vo) {
		return sqlSession.update(MAPPER+".updatereview", vo);
	}	
	
	//리뷰 사진 수정하기	
	public int updatereviewimg0(FileVo vo) {
	return sqlSession.update(MAPPER+".updatereviewimg0", vo);
	}
	
	public int updatereviewimg1(FileVo vo) {
	return sqlSession.update(MAPPER+".updatereviewimg1", vo);
	}
	
	public int updatereviewimg2(FileVo vo) {
	return sqlSession.update(MAPPER+".updatereviewimg2", vo);
	}
	
	public int updatereviewimg3(FileVo vo) {
	return sqlSession.update(MAPPER+".updatereviewimg3", vo);
	}
	
	public int updatereviewimg4(FileVo vo) {
	return sqlSession.update(MAPPER+".updatereviewimg4", vo);
	}
	
	
	
	public List<ReviewVo> reviewRegList2(ReviewVo vo) {
		return sqlSession.selectList(MAPPER+".reviewRegList2", vo);
		}
	
	
}