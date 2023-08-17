package com.crfr.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crfr.vo.MemberVo;

@Repository
public class MemberDao{
	
	public static final String MAPPER = "MemberMapper";
	SqlSession sqlSession;
	
	@Autowired
	public MemberDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	public int checkId(String member_id) {
		int result = sqlSession.selectOne(MAPPER+".checkId",member_id);
		if(result != 1) {result = -1;} //아이디가 없을 때의 반환값		
		return result;
	}
	public int checkNickName(String member_nickname) {
		int result = sqlSession.selectOne(MAPPER+".checkNickName",member_nickname);
		if(result != 1) {result = -1;} //아이디가 없을 때의 반환값		
		return result;
	}
	
	public MemberVo login(String member_id, String member_pw) {	
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_pw", member_pw);
		
		return sqlSession.selectOne(MAPPER+".login", map);
	}
	public MemberVo findId(String member_name, String member_handphone) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_name", member_name);
		map.put("member_handphone", member_handphone);
		
		return sqlSession.selectOne(MAPPER+".findId", map);
	}
	public MemberVo findPw(String member_id, String member_name, String member_handphone){
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_name", member_name);
		map.put("member_handphone", member_handphone);
		
		return sqlSession.selectOne(MAPPER+".findPw", map);
	}
	public MemberVo find_pw_edit(MemberVo vo) {
		int result = -1; //업데이트 실패
		result = sqlSession.update(MAPPER+".find_pw_edit",vo);
		MemberVo updatedVo = null;
		if(result == 1) {
			updatedVo = sqlSession.selectOne(MAPPER+".selectOne", vo.getMember_id());
		}
		return updatedVo;
	}
	public int join(MemberVo vo) {	
		return sqlSession.insert(MAPPER+".join", vo);
	}
	
	public int selectMemberIdx(MemberVo memberVo) {
		return sqlSession.selectOne(MAPPER+".selectMemberIdx", memberVo);
	}	

	public int selectCountMemberIdxReview(MemberVo memberVo) {
		return sqlSession.selectOne(MAPPER+".selectCountMemberIdxReview", memberVo);
	}	
	
	public int insertCouponReview(int member_idx, Date date) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("member_idx", member_idx);
	    map.put("coupon_expDate", date);
		return sqlSession.insert(MAPPER+".insertCouponReview", map);
	}
	
	public int insertCouponJoin(int member_idx, Date date) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("member_idx", member_idx);
	    map.put("coupon_expDate", date);
		return sqlSession.insert(MAPPER+".insertCouponJoin", map);
	}	
}
