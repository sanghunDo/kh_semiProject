package semi.adminMode.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import semi.adminMode.model.dao.AdminModeDao;
import semi.board.solve.model.vo.SolveBoard;
import semi.member.model.vo.Member;

public class AdminModeService {

	public List<Member> selectAllMember() {
		List<Member> list = null;
		Connection conn = getConnection();
		list = new AdminModeDao().selectAllMember(conn);
		return list;
	}

	public int deleteProfile(String userId) {
		int result = 0;
		Connection conn = getConnection();
		result = new AdminModeDao().deleteProfile(conn, userId);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		return result;
	}

	public int insertSolvePostReport(SolveBoard sb, String reason, String userComment) {
		int result = 0;
		Connection conn = getConnection();
		result = new AdminModeDao().insertSolvePostReport(conn, sb, reason, userComment);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		return result;
	}

}
