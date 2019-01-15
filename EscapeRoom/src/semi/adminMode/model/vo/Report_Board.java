package semi.adminMode.model.vo;

public class Report_Board {
	private String category;
	private int postNo;
	private String postTitle;
	private String postWriter;
	private String reason;
	private String userComment;
	
	public Report_Board() {}
	
	public Report_Board(String category,
						int postNo,
						String postTitle,
						String postWriter,
						String reason,
						String userComment) {

		this.category = category;
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.postWriter = postWriter;
		this.reason = reason;
		this.userComment = userComment;
	}
	
	@Override
	public String toString() {
		return category + " " + postNo + " " + postTitle + " " + postWriter + " " + reason + " " + userComment;
	}

	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public int getPostNo() {
		return postNo;
	}
	
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	
	public String getPostTitle() {
		return postTitle;
	}
	
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	
	public String getPostWriter() {
		return postWriter;
	}
	
	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}
	
	public String getReason() {
		return reason;
	}
	
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public String getUserComment() {
		return userComment;
	}
	
	public void setUserComment(String userComment) {
		this.userComment = userComment;
	}
}
