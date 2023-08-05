package com.crfr.vo;




public class FileVo {
	public int getFile_idx() {
		return file_idx;
	}
	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}
	public int getOne_inq_idx() {
		return one_inq_idx;
	}
	public void setOne_inq_idx(int one_inq_idx) {
		this.one_inq_idx = one_inq_idx;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
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
	private int file_idx;
	private int one_inq_idx;
	private int product_idx;
	private int review_idx;
	private String originFile;
	private String saveFile;
}
