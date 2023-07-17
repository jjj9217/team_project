package service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MembershipDao;
import vo.MembershipVo;

@Service("mSearchPw")
public class MembershipSearchPwService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipSearchPwService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public MembershipVo searchPw(String member_id, String member_name, String birthday, String email) {
		
		return dao.searchPw(member_id, member_name, birthday, email);
	}
	
}
