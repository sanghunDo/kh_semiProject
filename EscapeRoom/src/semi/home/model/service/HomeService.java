package semi.home.model.service;

import java.sql.Connection;

import semi.board.rank.model.vo.Rank;
import semi.home.model.dao.HomeDao;

import static semi.common.JDBCTemplate.*;

public class HomeService {

	public Rank selectRankTop() {
		Rank r = null;
		Connection conn = getConnection();
		r = new HomeDao().selectRankTop(conn);
		close(conn);
		return r;
	}

}
