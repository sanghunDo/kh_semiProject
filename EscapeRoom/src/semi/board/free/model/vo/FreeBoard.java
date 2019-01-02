package semi.board.free.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class FreeBoard implements Serializable {
	private int postNo;
	private String postTitle;
	private String postWriter;
	private String postContent;
	private String postOriginalFile;
	private String postRenamedFile;
	private Date postDate;
	private int postLike;
	private int postDislike;
	private boolean postReport;
	
	public FreeBoard() {
		
	}

	public FreeBoard(int postNo, String postTitle, String postWriter, String postContent, String postOriginalFile,
			String postRenamedFile, Date postDate, int postLike, int postDislike, boolean postReport) {
		
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.postWriter = postWriter;
		this.postContent = postContent;
		this.postOriginalFile = postOriginalFile;
		this.postRenamedFile = postRenamedFile;
		this.postDate = postDate;
		this.postLike = postLike;
		this.postDislike = postDislike;
		this.postReport = postReport;
	}
	
	@Override
	public String toString() {
		return "FreeBoard [postNo=" + postNo + ", postTitle=" + postTitle + ", postWriter=" + postWriter
				+ ", postContent=" + postContent + ", postOriginalFile=" + postOriginalFile + ", postRenamedFile="
				+ postRenamedFile + ", postDate=" + postDate + ", postLike=" + postLike + ", postDislike=" + postDislike
				+ ", postReport=" + postReport + "]";
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

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostOriginalFile() {
		return postOriginalFile;
	}

	public void setPostOriginalFile(String postOriginalFile) {
		this.postOriginalFile = postOriginalFile;
	}

	public String getPostRenamedFile() {
		return postRenamedFile;
	}

	public void setPostRenamedFile(String postRenamedFile) {
		this.postRenamedFile = postRenamedFile;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public int getPostLike() {
		return postLike;
	}

	public void setPostLike(int postLike) {
		this.postLike = postLike;
	}

	public int getPostDislike() {
		return postDislike;
	}

	public void setPostDislike(int postDislike) {
		this.postDislike = postDislike;
	}

	public boolean isPostReport() {
		return postReport;
	}

	public void setPostReport(boolean postReport) {
		this.postReport = postReport;
	}
	
	

	
	
	
}
