package semi.admin.model.vo;

import java.io.Serializable;

public class ReportBoard implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String category;
	private int postNo;
	private String postTitle;
	private String postWriter;
	private String reason;
	private String userComment;
	
	public ReportBoard() {
		
	}
	
	public ReportBoard(String category, int postNo, String postTitle, String postWriter, 
			String reason, String userComment) {
		this.category = category;
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.postWriter = postWriter;
		this.reason = reason;
		this.userComment = userComment;
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
	
	
	@Override
	public String toString() {
		return "ReportBoard [category =" + category + "postNo=" + postNo + ", postTitle=" + postTitle + ", postWriter=" + postWriter
				+ ", reason=" + reason + ", userComment=" + userComment + "]";
	}
	
}
