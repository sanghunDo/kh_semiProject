package semi.game.model.service;

import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import semi.game.model.dao.GameDao;
import semi.game.model.vo.PrologueObj;
public class GameService {

	public List<PrologueObj> getPrologueScenario() {
		Connection conn = getConnection();
		List<PrologueObj> scenario = new GameDao().getPrologueScenario(conn); 
		close(conn);
		return scenario;
	}
	
}
