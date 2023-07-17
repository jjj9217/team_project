package service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MembershipDao;
import vo.MembershipVo;

@Service("mMy_info_edit")
public class MembershipMyInfoEditService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipMyInfoEditService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public MembershipVo info_edit(MembershipVo membershipVo) {
		
		return dao.info_edit(membershipVo);
	}
	
}
