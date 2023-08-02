package service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.vo.MemberVo;

import dao.MemberDao;

@Service("mFindPw")	
	public class MemberFindPwService implements MemberService{
		private MemberDao dao;	
	@Autowired
	public MemberFindPwService(MemberDao dao) {
		this.dao = dao;
	}
	public MemberVo findPw(String member_id, String member_name, String member_handphone) {		
		return dao.findPw(member_id, member_name, member_handphone);
	}		
}	
	
