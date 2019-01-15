package semi.adminMode.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import semi.adminMode.model.dao.AdminModeDao;
import semi.adminMode.model.vo.Report_Board;
import semi.adminMode.model.vo.Report_Comment;
import semi.board.solve.model.vo.SolveBoard;
import semi.member.model.vo.Member;

public class AdminModeService {

	public List<Member> selectAllMember() {
		List<Member> list = null;
		Connection conn = getConnection();
		list = new AdminModeDao().selectAllMember(conn);
		close(conn);
		return list;
	}

	public int deleteProfile(String userId) {
		int result = 0;
		Connection conn = getConnection();
		result = new AdminModeDao().deleteProfile(conn, userId);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

	public int insertSolvePostReport(SolveBoard sb, String reason, String userComment) {
		int result = 0;
		Connection conn = getConnection();
		result = new AdminModeDao().insertSolvePostReport(conn, sb, reason, userComment);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

	public List<Report_Board> selectAllReportBoard() {
		List<Report_Board> list = null;
		Connection conn = getConnection();
		list = new AdminModeDao().selectAllReportBoard(conn);
		close(conn);
		return list;
	}

	public List<Report_Comment> selectAllReportComment() {
		List<Report_Comment> list = null;
		Connection conn = getConnection();
		list = new AdminModeDao().selectAllReportComment(conn);
		close(conn);
		return list;
	}

	public int deleteReportBoard(String category, int postNo) {
		int result = 0;
		Connection conn = getConnection();
		result = new AdminModeDao().deleteReportBoard(conn, category, postNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

	public int deleteReportComment(String category, int postNo, int commentNo) {
		int result = 0;
		Connection conn = getConnection();
		result = new AdminModeDao().deleteReportComment(conn, category, postNo, commentNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

	public int changeFreeTitleReported(int postNo) {
		int result = 0;
		Connection conn = getConnection();
		result = new AdminModeDao().changeFreeTitleReported(conn, postNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

	public int changeSolveTitleReported(int postNo) {
		int result = 0;
		Connection conn = getConnection();
		result = new AdminModeDao().changeSolveTitleReported(conn, postNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

}
