package semi.game.model.dao;

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
	public List<String> getPrologueScenario(Connection conn) {
		List<String> scenario = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getPrologueScenario");
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			scenario = new ArrayList<>();
			while(rset.next()) {
				scenario.add(rset.getString("scenario"));
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
