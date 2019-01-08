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

import static semi.common.JDBCTemplate.*;

import semi.member.model.vo.Member;

public class AdminDao {
	private Properties prop = new Properties();
	
	public AdminDao() {
		String fileName = AdminDao.class.getResource("/sql/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 관리자용 회원 정보 보기
	// 전체 회원 목록 가져오기
	public List<Member> selectMemberList(Connection conn) {
		List<Member> memberList = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("select * from member");

		try {
			// 쿼리문 입력 후 데이터 가져오기
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
			pstmt = conn.prepareStatement(query);
			Member m = new Member();
			
			rset = pstmt.executeQuery();
			
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
			pstmt = conn.prepareStatement(query);
			Member m = new Member();
		
			rset = pstmt.executeQuery();
		
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
				close(rset);
				close(pstmt);
			}
		
		return memberListByEmail;
	}
	
}
