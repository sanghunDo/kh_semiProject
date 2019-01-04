package semi.game.model.dao;

import static semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import semi.game.model.vo.PrologueObj;
public class GameDao {
	private Properties prop = new Properties();

	public GameDao() {
		String fileName = GameDao.class.getResource("/sql/game/game-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public List<PrologueObj> getPrologueScenario(Connection conn) {
		List<PrologueObj> scenario = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getPrologueScenario");
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			scenario = new ArrayList<>();
			while(rset.next()) {
				PrologueObj po = new PrologueObj();
				po.setNo(rset.getInt("no"));
				po.setContent(rset.getString("content"));
				po.setFileName(rset.getString("filename")!=null?rset.getString("filename"):"");
				scenario.add(po);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return scenario;
	}

}
