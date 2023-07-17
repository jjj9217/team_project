package service.membership;

import java.util.List;
import java.util.Map;

import vo.MembershipVo;

public interface MembershipService {
	
	default int checkId(String member_id) {return 0;}
	default int checkNickname(String member_nickname) {return 0;}
	default int join(MembershipVo membershipVo) {return 0;}
	default MembershipVo login(String member_id, String member_pw) {return null;}
	default MembershipVo info_edit(MembershipVo membershipVo) {return null;}
	default MembershipVo pw_edit(MembershipVo membershipVo) {return null;}
	default int drop_out(int member_idx) {return 0;}
	default MembershipVo searchId(String member_name, String birthday, String email) {return null;}
	default MembershipVo searchPw(String member_id, String member_name, String birthday, String email) {return null;}
	default MembershipVo search_pw_edit(MembershipVo membershipVo) {return null;}
	default int selectMember(Map<String, Object> map) {return 0;}
	default List<MembershipVo> selectList(Map<String, Object> map) {return null;}
	default MembershipVo selectView(int memeber_idx) {return null;}
	default MembershipVo member_edit(MembershipVo vo) {return null;}
	default int admin_drop_out(int member_idx) {return 0;}
}
