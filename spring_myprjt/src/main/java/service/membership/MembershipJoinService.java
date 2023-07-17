package service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MembershipDao;
import vo.MembershipVo;

@Service("mJoin")
public class MembershipJoinService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipJoinService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public int join(MembershipVo membershipVo) {
		
		return dao.join(membershipVo);
	}
	
}
