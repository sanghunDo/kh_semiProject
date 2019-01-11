package semi.game.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import semi.game.model.dao.GameDao;
import semi.game.model.vo.MainObj;
import semi.game.model.vo.PrologueObj;
import semi.member.model.vo.Member;
public class GameService {

	public List<PrologueObj> getPrologueScenario() {
		Connection conn = getConnection();
		List<PrologueObj> scenario = new GameDao().getPrologueScenario(conn); 
		close(conn);
		return scenario;
	}

	public void buyHint(Member m) {
		Connection conn = getConnection();
		int result = new GameDao().buyHint(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
	}

	public void useHint(Member m) {
		Connection conn = getConnection();
		int result = new GameDao().useHint(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
	}
	
	public String getHint(int num) {
		Connection conn = getConnection();
		String result = new GameDao().getHint(conn, num);
		close(conn);
		return result;
	}

	public List<MainObj> getObjList() {
		Connection conn = getConnection();
		List<MainObj> list = new GameDao().getObjList(conn);
		close(conn);
		return list;
	}

	
}
