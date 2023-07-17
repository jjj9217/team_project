package service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MembershipDao;
import vo.MembershipVo;

@Service("mLogin")
public class MembershipLoginService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipLoginService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public MembershipVo login(String member_id, String member_pw) {
		
		return dao.login(member_id, member_pw);
	}
	
}
