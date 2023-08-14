package com.crfr.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crfr.vo.NoticeVo;

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
}