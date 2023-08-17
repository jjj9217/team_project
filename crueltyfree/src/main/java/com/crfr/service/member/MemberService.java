package com.crfr.service.member;

import java.util.Date;

import com.crfr.vo.MemberVo;

public interface MemberService {
	default int checkId(String member_id) {return 0;}
	default int checkNickName(String member_nickname) {return 0;}
	default int join(MemberVo memberVo) {return 0;}
	default MemberVo login(String member_id, String member_pw) {return null;}
	default MemberVo findId(String member_name, String member_handphone) {return null;}
	default MemberVo findPw(String member_id, String member_name, String member_handphone) {return null;}
	default MemberVo find_pw_edit(MemberVo memberVo) {return null;}
	default int selectMemberIdx(MemberVo memberVo) {return 0;}
	default int selectCountMemberIdx_review(MemberVo memberVo) {return 0;}
	default int insertCouponJoin(int member_idx, Date date) {return 0;}
	default int insertCouponReview(int member_idx, Date date) {return 0;}
}
