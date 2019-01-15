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

	public String getComent(String objName, int rnum) {
		Connection conn = getConnection();
		String coment = new GameDao().getComent(conn, objName, rnum);
		close(conn);
		return coment;
	}

	public void checkLog(String userId) {
		Connection conn = getConnection();
		int result = new GameDao().checkLog(conn, userId);
		
		if(result==0) result = new GameDao().insertLog(conn, userId);
		else result = new GameDao().resetLog(conn, userId);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
	}

	public void updateState(String stateName, String userId) {
		Connection conn = getConnection();
		int result = new GameDao().updateState(conn, stateName, userId);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
	}

	public int checkState(String userId, String objName) {
		Connection conn = getConnection();
		int result = new GameDao().checkState(conn, objName, userId);
		close(conn);
		
		return result;
	}
}
