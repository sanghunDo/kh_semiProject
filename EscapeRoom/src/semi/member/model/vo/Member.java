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
	
	private String userid; // 아이디
	private String userpassword; // 패스워드
	private String useremail; // 이메일
	private String userprofileoriginalfile; // 원첨부파일
	private String userprofilerenamedfile; // 중복방지용 바꿔준 첨부파일
	private Date enrolldate; // 가입날짜
	
	public Member() {}
	
	public Member(String userid, String userpassword, String useremail, String userprofileoriginalfile,
			String userprofilerenamedfile, Date enrolldate) {
		super();
		this.userid = userid;
		this.userpassword = userpassword;
		this.useremail = useremail;
		this.userprofileoriginalfile = userprofileoriginalfile;
		this.userprofilerenamedfile = userprofilerenamedfile;
		this.enrolldate = enrolldate;
	}
	
	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getUserpassword() {
		return userpassword;
	}


	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}


	public String getUseremail() {
		return useremail;
	}


	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}


	public String getUserprofileoriginalfile() {
		return userprofileoriginalfile;
	}


	public void setUserprofileoriginalfile(String userprofileoriginalfile) {
		this.userprofileoriginalfile = userprofileoriginalfile;
	}


	public String getUserprofilerenamedfile() {
		return userprofilerenamedfile;
	}


	public void setUserprofilerenamedfile(String userprofilerenamedfile) {
		this.userprofilerenamedfile = userprofilerenamedfile;
	}


	public Date getEnrolldate() {
		return enrolldate;
	}


	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}
	
	@Override
	public String toString() {
		return userid + "," + userpassword + "," + useremail
				+ "," + userprofileoriginalfile + ","
				+ userprofilerenamedfile + "," + enrolldate;
	}

	@Override
	public void valueBound(HttpSessionBindingEvent e) {
		System.out.println("[" + userid + "]님이 로그인!");
		
		String ip = (String)e.getSession().getAttribute("ip");
		System.out.println("ip@Member@valueBound = " + ip);
		new MemberService().insertMemberLogger(userid, "1", ip);
	}
	
	@Override
	public void valueUnbound(HttpSessionBindingEvent e) {
		System.out.println("[" + userid + "]님이 로그아웃!");
		new MemberService().insertMemberLogger(userid, "0", "");
	}
}
