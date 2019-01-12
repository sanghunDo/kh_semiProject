package semi.board.rank.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import semi.board.rank.model.dao.RankDao;
import semi.board.rank.model.vo.Rank;

public class RankService {

	public List<Rank> selectRankList() {
		Connection conn = getConnection();
		
		List<Rank> list = new RankDao().selectRankList(conn);
		close(conn);
		
		return list;
	}

}
