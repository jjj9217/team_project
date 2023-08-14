package com.crfr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crfr.vo.FileVo;
import com.crfr.vo.NoticeVo;
import com.crfr.vo.OneInqVo;
import com.crfr.vo.ProductInqVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OneInqDao{
	//RegiProMapper.xml파일의 네임스페이스로 Mapper가 구분되므로
	//DAO에서 사용하는 Mapper의 네임스페이스를 상수로 정의함
	public static final String MAPPER = "com.crfr.ProductInsert";
	
	//MyBatis를 이용한 DB연결 및 SQL작업은 SqlSession객체가 담당함
	private final SqlSession sqlSession;
	
	// 공지사항 추가
	public int insertNotice (NoticeVo vo) {
		return sqlSession.insert(MAPPER+".insertNotice", vo);
	}

	// 공지사항 개수 반환
	public int checkNoticeCount(String notice_idx) {
		return sqlSession.selectOne(MAPPER+".checkNoticeCount", notice_idx);
	}
	
	
	//공지사항 리스트
	public List<NoticeVo> noticeList() {
	return sqlSession.selectList(MAPPER+".noticeList");
	}
		
	//공지사항 개수
	public int noticeListCount() {
		return sqlSession.selectOne(MAPPER+".noticeListCount");
	}
	
	//공지사항 뷰
	public NoticeVo noticeView(int notice_idx) {		
		return sqlSession.selectOne(MAPPER+".noticeView", notice_idx);
	} 
	
	//해당 공지사항 수정
	public int updatenotice(NoticeVo vo) {
			return sqlSession.update(MAPPER+".updatenotice", vo);
	}
	
	//해당 공지사항 삭제 메소드
	public int deletenotice(int notice_idx) {
		return sqlSession.delete(MAPPER+".deletenotice", notice_idx);
	}

	
	
	//1:1문의 작성에 관한 Dao
	//1:1문의 내용 작성하기
	public int insertOneinq(OneInqVo vo) {
	return sqlSession.insert(MAPPER+".insertOneinq", vo);
	}
	
	//1:1문의 번호 조회하기
	public int selectOneinq_idx(OneInqVo vo) {
	return sqlSession.selectOne(MAPPER+".selectOneinq_idx", vo);
	}
	
	//1:1문의 사진 작성하기	
	public int insertOneinqimg(FileVo vo) {
	return sqlSession.insert(MAPPER+".insertOneinqimg", vo);
	}
	
	//1:1문의 리스트
	public List<OneInqVo> oneinqList() {
	return sqlSession.selectList(MAPPER+".oneinqList");
	}
			
	//1:1문의 개수
	public int oneinqListCount() {
	return sqlSession.selectOne(MAPPER+".oneinqListCount");
	}
	
	//1:1문의 삭제하기
	public int deleteoneinq(OneInqVo vo) {
		return sqlSession.delete(MAPPER+".deleteoneinq", vo);
	}
	
	//1:1문의 수정하기
	public int updateoneinq (OneInqVo vo) {
		return sqlSession.update(MAPPER+".updateoneinq", vo);
	}
	

	
}