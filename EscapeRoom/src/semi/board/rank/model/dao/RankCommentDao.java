package semi.board.rank.model.dao;

import static semi.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import semi.board.rank.model.vo.RankComment;

public class RankCommentDao {
	
private Properties prop = new Properties();
	
	public RankCommentDao() {
		String fileName = RankDao.class.getResource("/sql/board/rank/rank-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertRankComment(Connection conn, RankComment rc) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertRankComment");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, rc.getCommentLevel());
			pstmt.setString(2, rc.getCommentWriter());
			pstmt.setString(3, rc.getCommentContent());
			
			if(rc.getCommentRef() == 0) {
				pstmt.setNull(4, 0);
			}
			else {
				pstmt.setInt(4, rc.getCommentRef());
			}
			
			result = pstmt.executeUpdate();
			
			System.out.println("댓글 등록한 유저 (DAO) : " + rc.getCommentWriter());
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<RankComment> selectAllCommentList(Connection conn) {
		
		List<RankComment> rCommentList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectCommentList");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			rCommentList = new ArrayList<>();
			
			while(rset.next()) {
				RankComment rc = new RankComment();
				rc.setCommentNo(rset.getInt("commentno"));
				rc.setCommentLevel(rset.getInt("commentlevel"));
				rc.setCommentWriter(rset.getString("commentwriter"));
				rc.setCommentContent(rset.getString("commentcontent"));
				rc.setCommentRef(rset.getInt("commentref"));
				rc.setCommentDate(rset.getDate("commentdate"));
				rc.setCommentLike(rset.getInt("commentlike"));
				rc.setCommentDisLike(rset.getInt("commentdislike"));
				
				rCommentList.add(rc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return rCommentList;
	}

	public int selectRankCommentCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		int totalRankComment = 0;
		ResultSet rset = null;
		String query = prop.getProperty("rankCommentCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalRankComment = rset.getInt("cnt");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalRankComment;
	}

	public int deleteRankComment(Connection conn, int rankCommentNo, int rankCommentLevel) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("deleteRankComment"));
			
			pstmt.setInt(1, rankCommentNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateCommentLike(Connection conn, int rankCommentNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateRankCommentLike");
		
		try {
			pstmt = conn.prepareStatement(query);
			
//			pstmt.setInt(1, rankCommentLike);
			pstmt.setInt(1, rankCommentNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateCommentDisLike(Connection conn, int rankCommentNo, int rankCommentDisLike) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateRankCommentDisLike");
		
		try {
			pstmt = conn.prepareStatement(query);
			
//			pstmt.setInt(1, rankCommentDisLike);
			pstmt.setInt(1, rankCommentNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getCommentLike(Connection conn, int rankCommentNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("getRankCommentLike");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, rankCommentNo);
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getCommentDisLike(Connection conn, int rankCommentNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("getRankCommentDisLike");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, rankCommentNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String getUpdateComment(Connection conn, int rankCommentNo) {
		
		String getUpdateComment = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getUpdateComment");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, rankCommentNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				getUpdateComment = rset.getString("commentcontent");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return getUpdateComment;
	}

	public int rankCommentUpdate(Connection conn, int rankCommentNo, String updateComment) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("rankCommentUpdate");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, updateComment);
			pstmt.setInt(2, rankCommentNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}