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

// 관리자용 회원 정보 보기
public class AdminDao {
	private Properties prop = new Properties();
	
	public AdminDao() {
		String fileName = AdminDao.class.getResource("/driver-properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 회원 목록 가져오기
	public List<Member> getMemberList(Connection conn) {
		List<Member> memberList = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("");
		// query.append("select * from member");

		try {
			// 쿼리문 입력 후 데이터 가져오기
			pstmt = conn.prepareStatement(query);
			Member m = new Member();
			/* 
			 * while(rset.next()) {
			 * m.setMemberId(rset.getString("memberId");
			 * m.setPassword(rset.getString("password");
			 * m.setMemberName(rset.getString("memberName");
			 * m.setGender(rset.getString("gender");
			 * m.setAge(rset.getInt("age");
			 * m.setEmail(rset.getString("email");
			 * m.setPhone(rset.getString("phone");
			 * m.setAddress(rset.getString("address");
			 * m.setHobby(rset.getString("hobby");
			 * m.setEnrollDate(rset.getDate("enrolldate");
			 * list.add(m);
			 * }
			 */
			
			
			// 쿼리 실행
			rset = pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return memberList;
	}
	
	// 회원 삭제
	
	// 게시글 삭제
	
}
