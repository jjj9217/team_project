package vo;

import java.util.Date;

public class MembershipVo {//데이터를 저장해서 전달하는 역할을 주로하는 클래스: DTO(Data Transfer Object)
//필드의 접근 지정자: private
	//아이디
	private String member_id;
	//비밀번호
	private String member_pw;
	//닉네임
	private String member_nickname;
	//이름
	private String member_name;
	//성별
	private int gender;
	//생년월일
	private String birthday;
	//휴대전화
	private String handphone;
	//이메일
	private String email;	
	
	//회원번호: 기본키
	private int member_idx;
	//회원가입일
	private Date join_date;
	//회원정보 수정일
	private Date update_date;
	//회원탈퇴일
	private Date cancel_date;
	//회원탈퇴여부 (1:회원유지, -1:회원탈퇴)
	private int cancel_or_not;
	//회원등급: 일반회원, 관리자, 슈퍼관리자
	private int grade;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getHandphone() {
		return handphone;
	}
	public void setHandphone(String handphone) {
		this.handphone = handphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public Date getCancel_date() {
		return cancel_date;
	}
	public void setCancel_date(Date cancel_date) {
		this.cancel_date = cancel_date;
	}
	public int getCancel_or_not() {
		return cancel_or_not;
	}
	public void setCancel_or_not(int cancel_or_not) {
		this.cancel_or_not = cancel_or_not;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
}
