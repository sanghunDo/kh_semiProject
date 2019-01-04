package semi.board.free.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BoardComment implements Serializable {
	private int commentNo;
	private int commentLevel;
	private String commentWriter;
	private String commentContent;
	//무슨 글에 대한 댓글인지
	private int ref;
	//무슨 댓글에 대한 대댓글인지 만약 레벨1이면 null
	private int commentRef;
	private Date commentDate;
	private int commentLike;
	private int commentDislike;
	private boolean commentReport;
	private int commentCnt;
	
	
	public BoardComment() {
		
	}
	
	public BoardComment(int commentNo, int commentLevel, String commentWriter, String commentContent, int ref,
			int commentRef, Date commentDate, int commentLike, int commentDislike, boolean commentReport) {
		this.commentNo = commentNo;
		this.commentLevel = commentLevel;
		this.commentWriter = commentWriter;
		this.commentContent = commentContent;
		this.ref = ref;
		this.commentRef = commentRef;
		this.commentDate = commentDate;
		this.commentLike = commentLike;
		this.commentDislike = commentDislike;
		this.commentReport = commentReport;
		this.commentCnt = commentCnt;
	}
	

	@Override
	public String toString() {
		return "BoardComment [commentNo=" + commentNo + ", commentLevel=" + commentLevel + ", commentWriter="
				+ commentWriter + ", commentContent=" + commentContent + ", ref=" + ref + ", commentRef=" + commentRef
				+ ", commentDate=" + commentDate + ", commentLike=" + commentLike + ", commentDislike=" + commentDislike
				+ ", commentReport=" + commentReport + commentCnt+ "]";
	}

	public int getCommentCnt() {
		return commentCnt;
	}

	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getCommentRef() {
		return commentRef;
	}

	public void setCommentRef(int commentRef) {
		this.commentRef = commentRef;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public int getCommentLike() {
		return commentLike;
	}

	public void setCommentLike(int commentLike) {
		this.commentLike = commentLike;
	}

	public int getCommentDislike() {
		return commentDislike;
	}

	public void setCommentDislike(int commentDislike) {
		this.commentDislike = commentDislike;
	}

	public boolean isCommentReport() {
		return commentReport;
	}

	public void setCommentReport(boolean commentReport) {
		this.commentReport = commentReport;
	}
	
	

	
}
