package semi.board.free.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import semi.board.free.model.vo.FreeBoard;

public class FreeBoardDao {

	public List<FreeBoard> boardSelectAll(int cPage, int numPerPage) {
		List<FreeBoard> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = " select v.* from (select row_number() over (order by postno desc) as rnum , v.* from board_free v) v where rnum between ? and ?";
		
		//1. 클래스등록확인
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
			pstmt = conn.prepareStatement(query);
	        int startRnum = (cPage-1)*numPerPage +1;
	        int endRnum = cPage*numPerPage;

	        pstmt.setInt(1, startRnum);
	        pstmt.setInt(2, endRnum);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			while(rset.next()) {
				FreeBoard fb = new FreeBoard();
				fb.setPostNo(rset.getInt("postno"));
				fb.setPostTitle(rset.getString("posttitle"));
				fb.setPostWriter(rset.getString("postwriter"));
				fb.setPostContent(rset.getString("postcontent"));
				fb.setPostOriginalFile(rset.getString("postoriginalfile"));
				fb.setPostRenamedFile(rset.getString("postrenamedfile"));
				fb.setPostDate(rset.getDate("postdate"));
				fb.setPostLike(rset.getInt("postlike"));
				fb.setPostDislike(rset.getInt("postdislike"));
				
				list.add(fb);
				
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		//2. Connection 객체 생성
		
		return list;
	}

	public int BoardCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int totalContent = 0;
		String query = "select count(*) as cnt from board_free";
		ResultSet rset = null;
		//1. 클래스등록확인
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalContent = rset.getInt("cnt");
			}
			
		} catch (SQLException e){
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			
		}
		return totalContent;
	}

	public List<FreeBoard> boardSelectBest3() {
		List<FreeBoard> bestList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select * from board_free order by postlike desc) where ROWNUM <4";
		
		try {
			//1. 클래스등록확인
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2. Connection 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
													"semi", //아이디 
													"semi");//비번
			//3.statement객체 생성
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			bestList = new ArrayList<>();
			while(rset.next()) {
				FreeBoard fb = new FreeBoard();
				fb.setPostNo(rset.getInt("postno"));
				fb.setPostTitle(rset.getString("posttitle"));
				fb.setPostWriter(rset.getString("postwriter"));
				fb.setPostContent(rset.getString("postcontent"));
				fb.setPostOriginalFile(rset.getString("postoriginalfile"));
				fb.setPostRenamedFile(rset.getString("postrenamedfile"));
				fb.setPostDate(rset.getDate("postdate"));
				fb.setPostLike(rset.getInt("postlike"));
				fb.setPostDislike(rset.getInt("postdislike"));
				
				bestList.add(fb);
				
			}
			System.out.println("bestList"+bestList);
			
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		//2. Connection 객체 생성
		
		return bestList;
	}
}
