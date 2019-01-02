package semi.member.model.service;

import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.commit;
import static semi.common.JDBCTemplate.getConnection;
import static semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Member;

public class MemberService {
	// 로그인 관련 상수
	public static final int LOGIN_OK = 1;
	public static final int WRONG_PASSWORD = 0;
	public static final int ID_NOT_EXIST = -1;
	
	public int loginCheck(Member m) {
		int result = ID_NOT_EXIST;
		Connection conn = getConnection();
		
		result = new MemberDao().loginCheck(conn, m);
		
		// 자원반납
		close(conn);
		
		return result;
	}

}
