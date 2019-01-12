package semi.board.rank.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class RankComment implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int commentNo;
	private int commentLevel;
	private String commentWriter;
	private String commentContent;
	private int commentRef;
	private Date commentDate;
	private int commentLike;
	private int commentDisLike;
	private char commentReport;
	
	
	public RankComment() {}

	public RankComment(int commentNo, int commentLevel, String commentWriter, String commentContent, int commentRef,
			Date commentDate, int commentLike, int commentDisLike, char commentReport) {
		this.commentNo = commentNo;
		this.commentLevel = commentLevel;
		this.commentWriter = commentWriter;
		this.commentContent = commentContent;
		this.commentRef = commentRef;
		this.commentDate = commentDate;
		this.commentLike = commentLike;
		this.commentDisLike = commentDisLike;
		this.commentReport = commentReport;
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

	public int getCommentDisLike() {
		return commentDisLike;
	}

	public void setCommentDisLike(int commentDisLike) {
		this.commentDisLike = commentDisLike;
	}

	public char getCommentReport() {
		return commentReport;
	}

	public void setCommentReport(char commentReport) {
		this.commentReport = commentReport;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "RankComment [commentNo=" + commentNo + ", commentLevel=" + commentLevel + ", commentWriter="
				+ commentWriter + ", commentContent=" + commentContent + ", commentRef=" + commentRef + ", commentDate="
				+ commentDate + ", commentLike=" + commentLike + ", commentDisLike=" + commentDisLike
				+ ", commentReport=" + commentReport + "]";
	}
}