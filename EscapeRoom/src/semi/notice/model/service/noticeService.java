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

	public int selectTotalCount() {
		int totalCount = 0;
		Connection conn = getConnection();
		totalCount = new noticeDao().selectTotalCount(conn);
		close(conn);
		return totalCount;
	}

	public Notice selectOneNotice(int noticeNo) {
		Notice n = null;
		Connection conn = getConnection();
		n = new noticeDao().selectOneNotice(conn, noticeNo);
		close(conn);
		return n;
	}

	public int deleteNotice(int noticeNo) {
		int result = 0;
		Connection conn = getConnection();
		result = new noticeDao().deleteNotice(conn, noticeNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

	public int updateNotice(Notice n) {
		int result = 0;
		Connection conn = getConnection();
		result = new noticeDao().updateNotice(conn, n);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

}
