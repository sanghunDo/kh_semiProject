package semi.home.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import semi.board.rank.model.vo.Rank;
import static semi.common.JDBCTemplate.*;

public class HomeDao {

	private Properties prop = new Properties();
	
	public HomeDao() {
		String fileName = HomeDao.class.getResource("/sql/home/home-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Rank selectRankTop(Connection conn) {
		Rank r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectRankTop");

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
	            r = new Rank();
	            r.setGameId(rset.getString("userid"));
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
