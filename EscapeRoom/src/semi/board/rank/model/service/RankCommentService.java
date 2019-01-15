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

}
