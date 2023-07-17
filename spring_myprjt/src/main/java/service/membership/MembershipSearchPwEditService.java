package service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MembershipDao;
import vo.MembershipVo;

@Service("mSearch_pw_edit")
public class MembershipSearchPwEditService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipSearchPwEditService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public MembershipVo search_pw_edit(MembershipVo membershipVo) {
		
		return dao.search_pw_edit(membershipVo);
	}
	
}
