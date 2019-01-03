package semi.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
<<<<<<< HEAD
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import semi.common.JDBCTemplate.*;
import semi.member.model.vo.Member;
=======
import java.sql.PreparedStatement;
import java.util.Properties;
import static semi.common.JDBCTemplate.*;
>>>>>>> d992ac243f2c9aa36c6e2f643e8e803079c15ac7

public class MemberDao {
	Properties prop = new Properties();
	
	public MemberDao() {
<<<<<<< HEAD
		String fileName = MemberDao.class.getResource("/resources/driver-properties").getPath();
=======
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
>>>>>>> d992ac243f2c9aa36c6e2f643e8e803079c15ac7
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
<<<<<<< HEAD
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
	
=======
		
	}
	
	public int loginCheck(Connection conn, Member m) {
		int result = -1;
		PreparedStatement pstmt = null;
		
	}

>>>>>>> d992ac243f2c9aa36c6e2f643e8e803079c15ac7
}
