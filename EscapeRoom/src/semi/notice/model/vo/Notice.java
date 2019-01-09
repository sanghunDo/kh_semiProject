package semi.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeOriginalFile;
	private String noticeRenamedFile;
	private String noticeUrgent;
	private Date noticeDate;
	
	public Notice() {}
	
	public Notice(String noticeTitle,
				  String noticeContent,
				  String noticeOriginalFile,
				  String noticeRenamedFile,
				  String noticeUrgent) {
		
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeOriginalFile = noticeOriginalFile;
		this.noticeRenamedFile = noticeRenamedFile;
		this.noticeUrgent = noticeUrgent;
	}
	
	public Notice(int noticeNo,
			  String noticeTitle,
			  String noticeContent,
			  String noticeOriginalFile,
			  String noticeRenamedFile,
			  String noticeUrgent,
			  Date noticeDate) {
		
		this(noticeTitle, noticeContent, noticeOriginalFile, noticeRenamedFile, noticeUrgent);
		this.noticeNo = noticeNo;
		this.noticeDate = noticeDate;
	}
	
	@Override
	public String toString() {
		return noticeNo + " " + noticeTitle + " " + noticeContent + " " + noticeOriginalFile + " " +
					noticeRenamedFile + " " + noticeUrgent + " " + noticeDate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeOriginalFile() {
		return noticeOriginalFile;
	}

	public void setNoticeOriginalFile(String noticeOriginalFile) {
		this.noticeOriginalFile = noticeOriginalFile;
	}

	public String getNoticeRenamedFile() {
		return noticeRenamedFile;
	}

	public void setNoticeRenamedFile(String noticeRenamedFile) {
		this.noticeRenamedFile = noticeRenamedFile;
	}

	public String getNoticeUrgent() {
		return noticeUrgent;
	}

	public void setNoticeUrgent(String noticeUrgent) {
		this.noticeUrgent = noticeUrgent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
}
