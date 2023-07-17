package service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MembershipDao;
import vo.MembershipVo;

@Service("mMy_pw_edit")
public class MembershipMyPwEditService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipMyPwEditService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public MembershipVo pw_edit(MembershipVo membershipVo) {
		
		return dao.pw_edit(membershipVo);
	}
	
}
