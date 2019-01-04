package semi.game.model.service;

import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import semi.game.model.dao.GameDao;
public class GameService {

	public List<String> getPrologueScenario() {
		Connection conn = getConnection();
		List<String> scenario = new GameDao().getPrologueScenario(conn); 
		close(conn);
		return scenario;
	}
	
}
