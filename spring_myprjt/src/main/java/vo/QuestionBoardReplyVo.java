package vo;

import java.util.Date;

public class QuestionBoardReplyVo {
	private int reply_idx;
	private int all_reply_number;
	private String content;
	private Date post_date;
	private int member_idx;
	private int board_idx;
	private String member_nickname;
	private int del_or_not;
	private Date del_date;
	private String board_initial;
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public int getAll_reply_number() {
		return all_reply_number;
	}
	public void setAll_reply_number(int all_reply_number) {
		this.all_reply_number = all_reply_number;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public int getDel_or_not() {
		return del_or_not;
	}
	public void setDel_or_not(int del_or_not) {
		this.del_or_not = del_or_not;
	}
	public Date getDel_date() {
		return del_date;
	}
	public void setDel_date(Date del_date) {
		this.del_date = del_date;
	}
	public String getBoard_initial() {
		return board_initial;
	}
	public void setBoard_initial(String board_initial) {
		this.board_initial = board_initial;
	}
	
}
