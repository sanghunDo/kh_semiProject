package semi.board.rank.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import semi.board.rank.model.dao.RankDao;
import semi.board.rank.model.vo.Rank;

public class RankService {

	public List<Rank> selectRankList(int best1, int best10) {
		Connection conn = getConnection();
		
		List<Rank> list = new RankDao().selectRankList(conn, best1, best10);
		close(conn);
		
		return list;
	}

}
