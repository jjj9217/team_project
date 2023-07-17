package service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MembershipDao;
import vo.MembershipVo;

@Service("mSearchId")
public class MembershipSearchIdService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipSearchIdService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public MembershipVo searchId(String member_name, String birthday, String email) {
		
		return dao.searchId(member_name, birthday, email);
	}
	
}
