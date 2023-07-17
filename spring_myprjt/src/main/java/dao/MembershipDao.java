package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import common.DBConnectionPool;
import vo.MembershipVo;

@Repository
public class MembershipDao{
	
	public static final String MAPPER = "MembershipMapper";
	SqlSession sqlSession;
	
	@Autowired
	public MembershipDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public int checkId(String member_id) {
		int result = sqlSession.selectOne(MAPPER+".checkId",member_id);
		if(result != 1) {result = -1;} //아이디가 없을 때의 반환값		
		return result;
	}
	
	public int checkNickname(String member_nickname) {
		int result = sqlSession.selectOne(MAPPER+".checkNickname",member_nickname);
		if(result != 1) {result = -1;} //아이디가 없을 때의 반환값		
		return result;
	}
			
	public int join(MembershipVo vo) {		
		return sqlSession.insert(MAPPER+".join", vo);
	}
	
	public MembershipVo login(String member_id, String member_pw) {	
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_pw", member_pw);
		
		return sqlSession.selectOne(MAPPER+".login", map);
	}
	
	public MembershipVo info_edit(MembershipVo vo) {
		int result = -1; //업데이트 실패
		result = sqlSession.update(MAPPER+".info_edit",vo);
		MembershipVo updatedVo = null;
		if(result == 1) {
			updatedVo = sqlSession.selectOne(MAPPER+".selectOne", vo.getMember_id());
		}
		return updatedVo;
	}
	
	public MembershipVo pw_edit(MembershipVo vo) {
		int result = -1; //업데이트 실패
		result = sqlSession.update(MAPPER+".pw_edit",vo);
		MembershipVo updatedVo = null;
		if(result == 1) {
			updatedVo = sqlSession.selectOne(MAPPER+".selectOne", vo.getMember_id());
		}
		return updatedVo;
	}
	
	public int drop_out(int member_idx) {
		return sqlSession.update(MAPPER+".drop_out", member_idx);
	}
	
	public MembershipVo searchId(String member_name, String birthday, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_name", member_name);
		map.put("birthday", birthday);
		map.put("email", email);
		
		return sqlSession.selectOne(MAPPER+".searchId", map);
	}
	
	public MembershipVo searchPw(String member_id, String member_name, String birthday, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_name", member_name);
		map.put("birthday", birthday);
		map.put("email", email);
		
		return sqlSession.selectOne(MAPPER+".searchPw", map);
	}
	
	public MembershipVo search_pw_edit(MembershipVo vo) {
		int result = -1; //업데이트 실패
		result = sqlSession.update(MAPPER+".search_pw_edit",vo);
		MembershipVo updatedVo = null;
		if(result == 1) {
			updatedVo = sqlSession.selectOne(MAPPER+".selectOne", vo.getMember_id());
		}
		return updatedVo;
	}
	
	//회원수 반환
	public int selectMember(Map<String, Object> map) {		
		return sqlSession.selectOne(MAPPER+".selectMember", map);
	}
	
	//회원 목록을 반환하는 메소드
	public List<MembershipVo> selectList(Map<String, Object> map) {
		return sqlSession.selectList(MAPPER+".selectList",map);
	}
	
	public MembershipVo selectView(int memeber_idx) {
		return sqlSession.selectOne(MAPPER+".selectView",memeber_idx);
	}
	
	public MembershipVo member_edit(MembershipVo vo) {
		int result = -1; //업데이트 실패
		result = sqlSession.update(MAPPER+".member_edit",vo);
		MembershipVo updatedVo = null;
		if(result == 1) {
			updatedVo = sqlSession.selectOne(MAPPER+".selectOne", vo.getMember_id());
		}
		return updatedVo;
	}
	
	public int admin_drop_out(int member_idx) {
		return sqlSession.update(MAPPER+".admin_drop_out", member_idx);
	}
}
