package semi.board.rank.model.dao;

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

import semi.board.rank.model.vo.Rank;

public class RankDao {
	
	private Properties prop = new Properties();
	
	public RankDao() {
		String fileName = RankDao.class.getResource("/sql/board/rank/rank-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Rank> selectRankList(Connection conn) {
		
		List<Rank> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectRankList");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				Rank r = new Rank();
				r.setPlayno(rset.getInt("playno"));
				r.setGameId(rset.getString("gameid"));
				r.setGameruntime(rset.getLong("gameruntime"));
				r.setGameescapedate(rset.getDate("gameescapedate"));
				
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public Rank viewOne(Connection conn, String gameId) {
		
		Rank r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectbest3");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, gameId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				r = new Rank();
				r.setPlayno(rset.getInt("playno"));
				r.setGameId(rset.getString("gameId"));
				r.setUserprofilerenamedfile(rset.getString("userprofilerenamedfile"));
				r.setGameruntime(rset.getLong("gameruntime"));
				r.setGameescapedate(rset.getDate("gameescapedate"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
	}	
}