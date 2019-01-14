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
	
	// 로그인 여부 확인
	public int loginCheck(Member m) {
		// -1: 없는 아이디
		int result = -1;
		// DB와 연결
		Connection conn = getConnection();		
		result = new AdminDao().loginCheck(conn, m);
		close(conn);		
		return result;
	}
	
	// 관리자용 회원 정보 상세보기
	public Member selectOne(String userId) {
		Connection conn = getConnection();		
		Member m = new AdminDao().selectOne(conn, userId);
		close(conn);
		return m;
	}
	
	// 관리자용 회원 수정하기
	public int updateMember(Member m) {
		Connection conn = getConnection();
		int result = 0;
		result = new AdminDao().updateMember(conn, m);
		
		// DML의 update문이므로 트랜잭션 처리
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}
	
	// 관리자용 회원 비밀번호 변경
	public int updatePassword(Member m) {
		Connection conn = getConnection();
		int result = 0;
		System.out.println("서비스: " + m.getUserPassword());
		result = new AdminDao().updatePassword(conn, m);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	// 관리자용 회원 삭제하기
	public int deleteMember(String userId) {
		Connection conn = getConnection();
		int result = new AdminDao().deleteMember(conn, userId);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 관리자용 전체 회원 목록 보기
	public List<Member> selectMemberList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Member> list = new AdminDao().selectMemberList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	// 관리자용 전체 회원 수 보기
	public int selectMemberCount() {
		Connection conn = getConnection();
		int totalContent = new AdminDao().selectMemberCount(conn);
		close(conn);
		return totalContent;
	}
	
	// 아이디로 회원 검색
	public List<Member> searchByUserId(String keyWord, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Member> list = new AdminDao().searchByUserId(conn, keyWord, cPage, numPerPage);
		close(conn);
		return list;
		
	}
	
	// 이메일로 회원 검색
	public List<Member> searchByUserEmail(String keyWord, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Member> list = new AdminDao().searchByUserEmail(conn, keyWord, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	// 아이디로 회원검색 페이지바
	public int selectMemberCountByUserId(String searchKeyword) {
		Connection conn = getConnection();
		int totalContent = new AdminDao().selectMemberCountByUserId(conn, searchKeyword);
		close(conn);
		return totalContent;
	}
	
	// 이메일로 회원검색 페이지바
	public int selectMemberCountByUserEmail(String searchKeyword) {
		Connection conn = getConnection();
		int totalContent = new AdminDao().selectMemberCountByUserEmail(conn, searchKeyword);
		close(conn);
		return totalContent;
	}
	
	// 제목으로 게시글 검색시 목록 보여주기
	public List selectBoardByTitle(String searchKeyword, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List list = new AdminDao().selectBoardByTitle(conn);
		close(conn);
		return list;
	}
	
	// 제목 검색 페이징
	
	// 내용으로 게시긜 검색시 목록 보여주기
	public List selectBoardByContent(String searchKeyword, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List list = new AdminDao().selectBoardByContent(conn);
		close(conn);
		return list;
		
	}
	
	// 내용  검색 페이징
	
	// 게시글 제목 & 내용으로 검색시 게시글 목록 보여주기
	public List selectBoardByTitleAndContent(String searchKeyword, int cPage, int numPerPage) {
	    Connection conn = getConnection();
	    List list = new AdminDao().selectBoardByTitleAndContent(conn);
	    close(conn);
	    return list;
	   }
	
	  // 게시글 제목 & 내용 페이징
	   
	 // 작성자로 검색시 게시글 목록 보여주기
	  public List selectBoardByUser(String searchKeyword, int cPage, int numPerPage) {
		 Connection conn = getConnection();
	     List list = new AdminDao().selectBoardByUser(conn);
	     close(conn);
	     return list;
	  }
	  
	  // 작성자 검색 페이징
	      
	  // 관리자용 신고 게시글 목록 보여주기
	  public List selectReportBoard() {
		  Connection conn = getConnection();
		  List list = new AdminDao().selectReportBoard(conn);
		  close(conn);
		  return list;
	  }
	  
	  // 관리자용 신고 게시글 페이징
	  public int selectReportBoardCount() {
	   Connection conn = getConnection();
	   int totalContent = 0;
	   close(conn);
	   return totalContent;
	   }
	  
	  // 관리자용 신고 댓글 목록 보여주기
	  public List selectReportBoardCmt() {
		  Connection conn = getConnection();
		  List list = new AdminDao().selectReportBoardCmt(conn);
		  close(conn);
		  return list;
	  }
	  
	// 관리자용 신고 댓글 페이징
	  public int selectReportBoardCmtCount() {
		  Connection conn = getConnection();
		   int totalComment = 0;
		   close(conn);
		   return totalComment;
	  }
	
}
