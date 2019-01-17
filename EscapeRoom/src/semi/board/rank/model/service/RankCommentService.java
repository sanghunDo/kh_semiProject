package semi.board.rank.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import semi.board.rank.model.dao.RankCommentDao;
import semi.board.rank.model.vo.RankComment;

public class RankCommentService {

	public int insertRankComment(RankComment rc) {
		
		Connection conn = getConnection();
		
		int result = new RankCommentDao().insertRankComment(conn, rc);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public List<RankComment> selectAllCommentList() {
		
		List<RankComment> rCommentList = null;
		Connection conn = getConnection();
		
		rCommentList = new RankCommentDao().selectAllCommentList(conn);
		
		close(conn);
		
		return rCommentList;
	}

	public int selectRankCommentCount() {
		
		Connection conn = getConnection();
		
		int totalRankComment = new RankCommentDao().selectRankCommentCount(conn);
		
		close(conn);
		
		return totalRankComment;
	}

	public int deleteRankComment(int rankCommentNo, int rankCommentLevel) {
		
		int result = 0;
		
		Connection conn = getConnection();
		
		result = new RankCommentDao().deleteRankComment(conn, rankCommentNo, rankCommentLevel);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int updateCommentLike(int rankCommentNo) {
		
		int result = 0;
		
		Connection conn = getConnection();
		
		result = new RankCommentDao().updateCommentLike(conn, rankCommentNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int getCommentLike(int rankCommentNo) {
		
		int result = 0;
		
		Connection conn = getConnection();
		
		result = new RankCommentDao().getCommentLike(conn, rankCommentNo);
		
		close(conn);
		
		return result;
	}

	public int updateCommentDisLike(int rankCommentNo, int rankCommentDisLike) {
		
		int result = 0;
		Connection conn = getConnection();
		
		result = new RankCommentDao().updateCommentDisLike(conn, rankCommentNo, rankCommentDisLike);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	public int rankCommentUpdate(int rankCommentNo, String updateComment) {
		
		int result = 0;
		Connection conn = getConnection();
		
		result = new RankCommentDao().rankCommentUpdate(conn, rankCommentNo, updateComment);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int getCommentDisLike(int rankCommentNo) {
		
		int result = 0;
		Connection conn = getConnection();
		
		result = new RankCommentDao().getCommentDisLike(conn, rankCommentNo);
		
		close(conn);
		
		return result;
	}

	public String getUpdateComment(int rankCommentNo) {
		
		String getUpdateComment = "";
		
		Connection conn = getConnection();
		
		getUpdateComment = new RankCommentDao().getUpdateComment(conn, rankCommentNo);
		
		close(conn);
		
		return getUpdateComment;
	}
}