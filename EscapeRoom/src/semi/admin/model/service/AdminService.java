package semi.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import static semi.common.JDBCTemplate.*;

import semi.admin.model.dao.AdminDao;
import semi.member.model.vo.Member;

public class AdminService {
	// 로그인 관련 상수
	public static final int LOGIN_OK = 1;
	public static final int WRONG_PASSWORD = 0;
	public static final int ID_NOT_EXIST = -1;
	
	public static final String LOGIN = "1";
	public static final String LOGOUT = "0";
	
	public int loginCheck(Member m) {
		int result = -1;
		Connection conn = getConnection();
		close(conn);
		return result;
	}
	
	// 관리자용 회원정보 상세보기
	public Member selectOne(String userId) {
		Connection conn = getConnection();
		Member m = new AdminDao().selectOne(conn, userId);
		
		close(conn);
		return m;
	}

	public List<Member> selectMemberList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Member> list = new AdminDao().selectMemberList(conn, cPage, numPerPage);
		return list;
	}
	
	public int selectMemberCount() {
		Connection conn = getConnection();
		int totalContent = new AdminDao().selectMemberCount(conn);
		return totalContent;
	}
	
	

}
