package semi.adminMode.model.dao;

import static semi.common.JDBCTemplate.close;

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

import semi.adminMode.model.vo.Report_Board;
import semi.adminMode.model.vo.Report_Comment;
import semi.board.solve.model.vo.SolveBoard;
import semi.member.model.vo.Member;

public class AdminModeDao {

	private Properties prop = new Properties();
	
	public AdminModeDao() {
		String fileName = AdminModeDao.class.getResource("/sql/adminMode/adminMode-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Member> selectAllMember(Connection conn) {
		List<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectAllMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setUserId(rset.getString("userId"));
				m.setUserEmail(rset.getString("userEmail"));
				m.setUserProfileRenamedFile(rset.getString("userProfileRenamedFile"));
				m.setEnrollDate(rset.getDate("enrollDate"));
				m.setCoin(rset.getInt("coin"));
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int deleteProfile(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteProfile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, null);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertSolvePostReport(Connection conn, SolveBoard sb, String reason, String userComment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String category = "S";
		String query = prop.getProperty("insertSolvePostReport");
		
		try {
			pstmt = conn.prepareStatement("insertSolvePostReport");
			
			pstmt.setString(1, category);
			pstmt.setInt(2, sb.getPostNo());
			pstmt.setString(3, sb.getPostTitle());
			pstmt.setString(4, sb.getPostWriter());
			pstmt.setString(5, reason);
			pstmt.setString(6, userComment);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<Report_Board> selectAllReportBoard(Connection conn) {
		List<Report_Board> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAllReportBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				Report_Board rb = new Report_Board();
				
				rb.setCategory(rset.getString("category"));
				rb.setPostNo(rset.getInt("postNo"));
				rb.setPostTitle(rset.getString("postTitle"));
				rb.setPostWriter(rset.getString("postWriter"));
				rb.setReason(rset.getString("reason"));
				rb.setUserComment(rset.getString("userComment"));
				
				list.add(rb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public List<Report_Comment> selectAllReportComment(Connection conn) {
		List<Report_Comment> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAllReportComment");
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				Report_Comment rc = new Report_Comment();
				
				rc.setCategory(rset.getString("category"));
				rc.setPostNo(rset.getInt("postNo"));
				rc.setCommentNo(rset.getInt("commentNo"));
				rc.setCommentContent(rset.getString("commentContent"));
				rc.setCommentWriter(rset.getString("commentWriter"));
				rc.setReason(rset.getString("reason"));
				rc.setUserComment(rset.getString("userComment"));
				
				list.add(rc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int deleteReport(Connection conn, String category, int postNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteReportBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			pstmt.setInt(2, postNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
