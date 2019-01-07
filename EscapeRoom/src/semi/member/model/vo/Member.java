package semi.member.model.vo;
import java.io.Serializable;
import java.sql.Date;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import semi.member.model.service.MemberService;

public class Member implements Serializable, HttpSessionBindingListener{
/**
 * 서버를 나누어 쓰게 되면 서버컴퓨터가 여러 개인 경우가 생긴다.
 * 서버간의 통신을 할 때 Sericalizable이 반드시 구현된 객체여야 한다.
 */
	
	private String userId; // 아이디
	private String userPassword; // 패스워드
	private String userEmail; // 이메일
	private String userProfileOriginalFile; // 원첨부파일
	private String userProfileRenamedFile; // 중복방지용 바꿔준 첨부파일
	private Date enrollDate; // 가입날짜
	
	public Member() {}
	
	public Member(String userId, String userPassword, String userEmail, String userProfileOriginalFile,
			String userProfileRenamedFile, Date enrollDate) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userProfileOriginalFile = userProfileOriginalFile;
		this.userProfileRenamedFile = userProfileRenamedFile;
		this.enrollDate = enrollDate;
	}
	
	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPassword() {
		return userPassword;
	}


	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserProfileOriginalFile() {
		return userProfileOriginalFile;
	}


	public void setUserProfileOriginalFile(String userProfileOriginalFile) {
		this.userProfileOriginalFile = userProfileOriginalFile;
	}


	public String getUserProfileRenamedFile() {
		return userProfileRenamedFile;
	}


	public void setUserProfileRenamedFile(String userProfileRenamedFile) {
		this.userProfileRenamedFile = userProfileRenamedFile;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	
	@Override
	public String toString() {
		return userId + "," + userPassword + "," + userEmail
				+ "," + userProfileOriginalFile + ","
				+ userProfileRenamedFile + "," + enrollDate;
	}

	@Override
	public void valueBound(HttpSessionBindingEvent e) {
		System.out.println("[" + userId + "]님이 로그인!");
		
		String ip = (String)e.getSession().getAttribute("ip");
		System.out.println("ip@Member@valueBound = " + ip);
		new MemberService().insertMemberLogger(userId, "1", ip);
	}
	
	@Override
	public void valueUnbound(HttpSessionBindingEvent e) {
		System.out.println("[" + userId + "]님이 로그아웃!");
		new MemberService().insertMemberLogger(userId, "0", "");
	}
}
