package semi.home.model.service;

import java.sql.Connection;
import java.util.List;

import semi.board.rank.model.vo.Rank;
import semi.home.model.dao.HomeDao;
import semi.notice.model.vo.Notice;

import static semi.common.JDBCTemplate.*;

public class HomeService {

	public Rank selectRankTop() {
		Rank r = null;
		Connection conn = getConnection();
		r = new HomeDao().selectRankTop(conn);
		close(conn);
		return r;
	}

	public List<Notice> selectAllNotice() {
		List<Notice> list = null;
		Connection conn = getConnection();
		list = new HomeDao().selectAllNotice(conn);
		close(conn);
		return list;
	}

	public Notice selectLinkedNotice() {
		Notice n = null;
		Connection conn = getConnection();
		n = new HomeDao().selectLinkedNotice(conn);
		close(conn);
		return n;
	}
}
