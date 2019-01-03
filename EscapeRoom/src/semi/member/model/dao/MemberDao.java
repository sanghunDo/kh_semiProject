package semi.member.model.dao;

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

import semi.common.JDBCTemplate.*;
import semi.member.model.vo.Member;

public class MemberDao {
	Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/resources/driver-properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Member> getMemberList() {
		// 임시 객체
		List result = null;
		
		List<Member> memberList = new ArrayList<Member>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		// String query = prop.getProperty("");
		// DB에서 회원 테이블 가져오는 쿼리 작성
		
		try {
			// 쿼리문 입력 후 데이터 가져오기
			pstmt = conn.prepareStatement("");
			// 아이디, 비밀번호, 회원명 등
			
			// 쿼리 실행
			rset = pstmt.executeQuery();
			
			// 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
