package semi.notice.model.dao;

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

import semi.notice.model.vo.Notice;

public class noticeDao {

	private Properties prop = new Properties();
	
	public noticeDao() {
		String fileName = noticeDao.class.getResource("/sql/notice/notice-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getNoticeOriginalFile());
			pstmt.setString(4, n.getNoticeRenamedFile());
			pstmt.setString(5, n.getNoticeUrgent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<Notice> selectNoticeList(Connection conn, int cPage, int numPerPage) {
		List<Notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			int startRnum = (cPage-1) * numPerPage + 1;
			int endRnum = cPage * numPerPage;

			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("noticeNo"));
				n.setNoticeTitle(rset.getString("noticeTitle"));
				n.setNoticeContent(rset.getString("noticeContent"));
				n.setNoticeOriginalFile(rset.getString("noticeOriginalFile"));
				n.setNoticeRenamedFile(rset.getString("noticeRenamedFile"));
				n.setNoticeDate(rset.getDate("noticeDate"));
				n.setNoticeUrgent(rset.getString("noticeUrgent"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectTotalCount(Connection conn) {
		int totalCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalCount = rset.getInt("totalCount");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalCount;
	}

	public Notice selectOneNotice(Connection conn, int noticeNo) {
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOneNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				n = new Notice();
				
				n.setNoticeNo(noticeNo);
				n.setNoticeTitle(rset.getString("noticeTitle"));
				n.setNoticeContent(rset.getString("noticeContent"));
				n.setNoticeOriginalFile(rset.getString("noticeOriginalFile"));
				n.setNoticeRenamedFile(rset.getString("noticeRenamedFile"));
				n.setNoticeDate(rset.getDate("noticeDate"));
				n.setNoticeUrgent(rset.getString("noticeUrgent"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}

	public int deleteNotice(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getNoticeOriginalFile());
			pstmt.setString(4, n.getNoticeRenamedFile());
			pstmt.setString(5, n.getNoticeUrgent());
			pstmt.setInt(6, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int updateLinkX(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateLinkN");
		
		try {
			pstmt = conn.prepareStatement(query);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateLinkY(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateLinkY");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
