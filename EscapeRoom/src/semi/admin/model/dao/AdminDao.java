package semi.admin.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import semi.member.model.vo.Member;

import semi.admin.model.service.AdminService;

import static semi.common.JDBCTemplate.*;

public class AdminDao {
	private Properties prop = new Properties();
	
	public AdminDao() {
		// (WebContent/WEB-INF/)classes 폴더에서부터 시작하여 해당파일까지의 절대 경로
		// WEB-INF 폴더 아래에 넣어두면 서버에서 서비스 할 때 외부에서 URL로 직접 접근할 수 없게 되어 보안성이 좋다.
		String fileName = AdminDao.class.getResource("/sql/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 관리자용 회원 정보 상세보기
	public Member selectOne(Connection conn, String userId) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("");
		
		try {
			// 쿼리문 완성하기
			String jdbcUrl = "jdbc:oracle:thin@localhost:1521:orcl";
			String dbid = "java";
			String dbPass = "java";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			pstmt = conn.prepareStatement(query);
			
			
			// 쿼리 실행
			rset = pstmt.executeQuery();
			
			// 실행 후 결과를 list에 담기
			if(rset.next()) {
				m.setUserId("userid");
				m.setUserPassword("userPassword");
				m.setUserEmail("email");
				m.setUserProfileOriginalFile(rset.getString("userprofileoriginalfile"));
				
				/*
				아이디
				프로필 사진
				비밀번호
				이메일
				가입한 날짜
				플레이 시간
				클리어한 날짜
				작성한 게시글 수
				작성한 댓글 수
				*/
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally  {
			// 자원 반납
			close(rset);
			close(conn);
		}
		
		return m;
	}
	
	// 관리자용 전체 회원 목록 보기
	public List<Member> selectMemberList(Connection conn) {
		List<Member> memberList = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("select * from member");

		try {
			// 쿼리문 완성하기
			pstmt = conn.prepareStatement(query);
			Member m = new Member();
			
			// 쿼리 실행
			rset = pstmt.executeQuery();
			
			// 실행 후 결과를 list에 담기
			while(rset.next()) {
				m.setUserId(rset.getString("userId"));
				m.setUserPassword(rset.getString("password"));
			 	m.setUserEmail(rset.getString("email"));
			 	m.setEnrollDate(rset.getDate("enrolldate"));
			 	memberList.add(m);
			 	}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			close(rset);
			close(pstmt);
		}
		
		return memberList;
	}
	
	// 회원 아이디로 검색시 목록 보여주기
	public List<Member> selectMemberListById(Connection conn) {
		List<Member> memberListById = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		String query = prop.getProperty("select * from member where userid = ?");
		
		try {
			// 쿼리문 완성하기
			pstmt = conn.prepareStatement(query);
			Member m = new Member();
			
			// 쿼리문 실행
			rset = pstmt.executeQuery();
			
			// 실행 후 결과를 list에 담기
			while(rset.next()) {
				m.setUserId(rset.getString("memberId"));
				m.setUserPassword(rset.getString("password"));
			 	m.setUserEmail(rset.getString("email"));
			 	m.setEnrollDate(rset.getDate("enrolldate"));
			 	memberListById.add(m);
			 }
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			close(rset);
			close(pstmt);
		}
		
		return memberListById;
	}
	
	// 회원 이메일로 검색시 목록 보여주기
	public List<Member> selectMemberListByEmail(Connection conn) {
		List<Member> memberListByEmail = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("select * from member where useremail = ?");
		
		try {
			// 쿼리문 완성하기
			pstmt = conn.prepareStatement(query);
			Member m = new Member();
		
			// 쿼리문 실행하기
			rset = pstmt.executeQuery();
		
			// 실행 후 결과를 list에 담기
			while(rset.next()) {
				m.setUserId(rset.getString("memberId"));
				m.setUserPassword(rset.getString("password"));
				m.setUserEmail(rset.getString("email"));
				m.setEnrollDate(rset.getDate("enrolldate"));
				memberListByEmail.add(m);
			}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				// 자원 반납
				close(rset);
				close(pstmt);
			}
		
		return memberListByEmail;
	}
	
	// 게시글 제목 & 내용으로 검색시 목록 보여주기
	public List selectArticle() {
		List articleList = new ArrayList();
		return articleList;
	}
	
	// 댓글 검색시 목록 보여주기
	public List selectComment() {
		List commentList = new ArrayList();
		return commentList;
	}
}
