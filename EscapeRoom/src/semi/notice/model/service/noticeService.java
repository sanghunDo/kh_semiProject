package semi.notice.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import semi.notice.model.dao.noticeDao;
import semi.notice.model.vo.Notice;

public class noticeService {

	public int insertNotice(Notice n) {
		int result = 0;
		Connection conn = getConnection();
		result = new noticeDao().insertNotice(conn, n);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

	public List<Notice> selectNoticeList(int cPage, int numPerPage) {
		List<Notice> list = null;
		Connection conn = getConnection();
		list = new noticeDao().selectNoticeList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

}
