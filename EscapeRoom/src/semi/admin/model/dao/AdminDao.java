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
		// (WebContent/WEB-INF/classes) 폴더에서부터 시작하여 해당 파일까지의 절대경로
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
	
	// 로그인 여부 확인
	public int loginCheck(Connection conn, Member m) {
		// -1: 없는 아이디, 0: 아직 로그인 안 됨, 1: 로그인 됨
		int result = -1;
		
		// DB로 SQL문 요청하기 위한 객체 생성
		PreparedStatement pstmt = null;
		
		// select 문ㅇ르 통해서 데이터를 가져오고 ResultSet 객체에 데이터 저장
		ResultSet rset = null;
		
		String query = prop.getProperty("loginCheck");
		
		try {
			// 1. statement 객체 생성 및 미완성 쿼리문 완성
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPassword());
			pstmt.setString(3, m.getUserId());
			
			// 2. 쿼리 실행: DQL(select)라 executeQuery()
			rset = pstmt.executeQuery();
			
			// 3. 결과 변수  result에 담기
			if(rset.next()) {
				result = rset.getInt("logincheck"); // 컬럼명
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 4. 자원 반납
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	// 관리자용 회원 정보 상세보기
	public Member selectOne(Connection conn, String userId) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		
		try {
			// 미완성 쿼리문 완성시
			/*
			 * String jdbcUrl = "jdbc:oracle:thin@localhost:1521:orcl";
			 * String dbId = ""; // 계정 아이디
			 * String dbPwd = ""; // 계정 비밀번호
			 * Class.forName("oracle.jdbc.driver.OracleDriver");
			 */

			pstmt = conn.prepareStatement(query);
			
			// 미완성된 쿼리
			pstmt.setString(1, userId);
			
			// 쿼리 실행
			rset = pstmt.executeQuery();
			
			// 실행 후 결과를 list에 담기
			if(rset.next()) {
				m.setUserId("userid");
				m.setUserPassword("userPassword");
				m.setUserProfileOriginalFile(rset.getString("userprofileoriginalfile"));
				m.setUserProfileRenamedFile(rset.getString("userprofilerenamedfile"));
				m.setUserEmail("email");
				m.setEnrollDate(rset.getDate("enrolldate"));
				
				/*
				 * 추가?
				 * 플레이 시간
				 * 클리어한 날짜
				 * 작성한 게시글 수
				 * 작성한 댓글 수
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
	public List<Member> selectMemberList(Connection conn, String userId) {
		List<Member> memberList = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("select * from member");

		try {
			// 미완성 쿼리문
			pstmt = conn.prepareStatement(query);
	
			// 쿼리 실행
			rset = pstmt.executeQuery();
			
			// 실행 후 결과를 list에 담기
			while(rset.next()) {
				Member m = new Member();
				m.setUserId(rset.getString("userId"));
				m.setUserPassword(rset.getString("password"));
			 	m.setUserEmail(rset.getString("email"));
				m.setUserProfileOriginalFile(rset.getString("userprofileoriginalfile"));
				m.setUserProfileRenamedFile(rset.getString("userprofilerenamedfile"));
			 	m.setEnrollDate(rset.getDate("enrolldate"));
			 	memberList.add(m);
			 	}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return memberList;
	}
	
	// 회원 아이디로 검색시 목록 보여주기
	// @param userId
	// @return
	public List<Member> selectMemberListById(Connection conn, String userId) {
		List<Member> memberListById = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		String query = prop.getProperty("select * from member where userid = ?");
		
		try {
			// 미완성 쿼리문
			pstmt = conn.prepareStatement(query);
			
			// 쿼리문 실행
			rset = pstmt.executeQuery();
			
			// 실행 후 결과를 list에 담기
			while(rset.next()) {
				Member m = new Member();
				m.setUserId(rset.getString("memberId"));
				m.setUserPassword(rset.getString("password"));
			 	m.setUserEmail(rset.getString("email"));
				m.setUserProfileOriginalFile(rset.getString("userprofileoriginalfile"));
				m.setUserProfileRenamedFile(rset.getString("userprofilerenamedfile"));
			 	m.setEnrollDate(rset.getDate("enrolldate"));
			 	memberListById.add(m);
			 }
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return memberListById;
	}
	
	// 회원 이메일로 검색시 목록 보여주기
	public List<Member> selectMemberListByEmail(Connection conn, String userEamil) {
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
				m.setUserProfileOriginalFile(rset.getString("userprofileoriginalfile"));
				m.setUserProfileRenamedFile(rset.getString("userprofilerenamedfile"));
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
	
	// 댓글로 검색시 목록 보여주기
	public List selectComment() {
		List commentList = new ArrayList();
		return commentList;
	}
}
