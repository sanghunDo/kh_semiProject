package semi.adminMode.model.vo;

public class Report_Comment {
	private String category;
	private int postNo;
	private int commentNo;
	private String commentContent;
	private String commentWriter;
	private String reason;
	private String userComment;
	private String reasonChecked;
	
	public Report_Comment() {}
	
	public Report_Comment(String category,
						  int postNo,
						  int commentNo,
						  String commentContent,
						  String commentWriter,
						  String reason,
						  String userComment) {

		this.category = category;
		this.postNo = postNo;
		this.commentNo = commentNo;
		this.commentContent = commentContent;
		this.commentWriter = commentWriter;
		this.reason = reason;
		this.userComment = userComment;
	}
	
	public Report_Comment(String category,
			int postNo,
			int commentNo,
			String commentContent,
			String commentWriter,
			String reason,
			String userComment,
			String reasonChecked) {
		
		this.category = category;
		this.postNo = postNo;
		this.commentNo = commentNo;
		this.commentContent = commentContent;
		this.commentWriter = commentWriter;
		this.reason = reason;
		this.userComment = userComment;
		this.reasonChecked = reasonChecked;
	}
	
	@Override
	public String toString() {
		return category + " " + postNo + " " + commentNo + " " + commentContent + " " 
					+ commentWriter + " " + reason + " " + userComment + " " + reasonChecked; 
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
	
	public int getCommentNo() {
		return commentNo;
	}
	
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	
	public String getCommentContent() {
		return commentContent;
	}
	
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	
	public String getCommentWriter() {
		return commentWriter;
	}
	
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
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

	public String getReasonChecked() {
		return reasonChecked;
	}

	public void setReasonChecked(String reasonChecked) {
		this.reasonChecked = reasonChecked;
	}
}
