package semi.admin.model.vo;

import java.io.Serializable;

public class ReportBoardComment implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String category;
	private int postNo;
    private int commentNo;
    private String commentContent;
    private String commentWriter;
    private String reason;
    private String userComment;
    
    public ReportBoardComment() {
    	
    }
    
    public ReportBoardComment(String category, int postNo, int commentNo, String commentContent, 
    		String commentWriter, String reason, String userComment) {
    	this.category = category;
		this.postNo = postNo;
		this.commentNo = commentNo;
		this.commentWriter = commentWriter;
		this.commentContent = commentContent;
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
    
    
    @Override
	public String toString() {
		return "ReportBoardComment [category =" + category + "postNo=" + postNo + ", commentNo=" + commentNo + ", commentWriter=" + commentWriter
				+ ", commentContent=" + commentContent + ", reason=" + reason + ", userComment="
				+ userComment + "]";
	}
 }
