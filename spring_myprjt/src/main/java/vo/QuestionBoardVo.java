package vo;

import java.util.Date;

public class QuestionBoardVo {
	private int board_idx;
	private int all_board_number;
	private String title;
	private String content;
	private String originFile;
	private String saveFile;
	private Date post_date;
	private int read_count;
	private int member_idx;
	private String member_nickname;
	private int recommendation_count;
	private int reply_count;
	private int del_or_not;
	private Date del_date;
	private String board_initial;
	private int not_recommendation_count;	
	
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getAll_board_number() {
		return all_board_number;
	}
	public void setAll_board_number(int all_board_number) {
		this.all_board_number = all_board_number;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOriginFile() {
		return originFile;
	}
	public void setOriginFile(String originFile) {
		this.originFile = originFile;
	}
	public String getSaveFile() {
		return saveFile;
	}
	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	
	public int getRecommendation_count() {
		return recommendation_count;
	}
	public void setRecommendation_count(int recommendation_count) {
		this.recommendation_count = recommendation_count;
	}	
	
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
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
	public int getNot_recommendation_count() {
		return not_recommendation_count;
	}
	public void setNot_recommendation_count(int not_recommendation_count) {
		this.not_recommendation_count = not_recommendation_count;
	}
	
}
