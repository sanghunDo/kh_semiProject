package semi.member.model.service;

import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.commit;
import static semi.common.JDBCTemplate.getConnection;
import static semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import semi.board.free.model.vo.FreeBoard;
import semi.board.solve.model.vo.SolveBoard;
import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Member;
import semi.notice.model.vo.Notice;

public class MemberService {
	// 로그인 관련 상수
	public static final int LOGIN_OK = 1;
	public static final int WRONG_PASSWORD = 0;
	public static final int ID_NOT_EXIST = -1;
	
	public static final int EMAIL_OK = 1;
	public static final int EMAIL_NOT_EXIST = -1;

	// 로그인 여부 확인
	public int loginCheck(Member m) {
		int result = ID_NOT_EXIST;

		// DB와 연결
		Connection conn = getConnection();

		result = new MemberDao().loginCheck(conn, m);

		// 자원반납
		close(conn);

		return result;
	}
	
	// 아이디 이메일 일치하는지 유무 확인
	public int iDEmailCheck(Member m) {
		int result = ID_NOT_EXIST;
		
		// DB와 연결
		Connection conn = getConnection();
		
		result = new MemberDao().iDEmailCheck(conn, m);
		
		// 자원반납
		close(conn);
		
		return result;
	}
	
	// 이메일 여부 확인
	public int emailCheck(Member m) {
		int result = EMAIL_NOT_EXIST;
		
		// DB와 연결
		Connection conn = getConnection();
		
		result = new MemberDao().emailCheck(conn, m);
		
		// 자원반납
		close(conn);
		
		return result;
	}
	
	// 해당 이메일 회원 정보 보기
	public Member findIdByEmail(String userEmail) {
		Member m = null;
		
		Connection conn = getConnection();
		
		m = new MemberDao().findIdByEmail(conn, userEmail);
		
		// DQL(SELECT)이므로 트랜잭션 처리 하지 않는다.

		// 자원반납
		close(conn);

		return m;
	}
	
	// 회원정보보기
	public Member selectOne(String userId) {
		Member loggedInMember = null;

		// DB와 연결
		Connection conn = getConnection();

		loggedInMember = new MemberDao().selectOne(conn, userId);

		// DQL(SELECT)이므로 트랜잭션 처리 하지 않는다.

		// 자원반납
		close(conn);

		return loggedInMember;
	}
	

	// 로그인 기록
	public int insertMemberLogger(String userId, String status, String ip) {
		int result = 0;

		// DB와 연결
		Connection conn = getConnection();

		result = new MemberDao().insertMemberLogger(conn, userId, status, ip);

		// DML(INSERT, UPDATE, DELETE)이므로 반드시 트랜잭션처리 해야 한다.
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		// 자원반납
		close(conn);

		return result;

	}

	// 회원 추가(회원가입)
	public int insertMember(Member member) {
		// DB와 연결
		Connection conn = getConnection();

		int result = new MemberDao().insertMember(conn, member);

		// DML(INSERT, UPDATE, DELETE)이므로 반드시 트랜잭션처리 해야 한다.
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		// 자원반납
		close(conn);

		return result;

	}

	// 회원정보 수정
	public int updateMember(Member member) {
		int result = 0;

		// DB와 연결
		Connection conn = getConnection();

		result = new MemberDao().updateMember(conn, member);

		// DML(INSERT, UPDATE, DELETE)이므로 반드시 트랜잭션처리 해야 한다.
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		// 자원반납
		close(conn);

		return result;
	}

	// 회원탈퇴
	public int deleteMember(String userId) {
		// DB와 연결
		Connection conn = getConnection();

		int result = new MemberDao().deleteMember(conn, userId);

		// DML(INSERT, UPDATE, DELETE)이므로 반드시 트랜잭션처리 해야 한다.
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		// 자원반납
		close(conn);

		return result;
	}
	
	// 회원 비밀번호 변경
	public int updatePassword(Member m) {
		// DB와 연결
		Connection conn = getConnection();
		System.out.println("업데이트패스워드@서비스 = "+ m.getUserPassword());
		int result = new MemberDao().updatePassword(conn, m);
		
		// DML(INSERT, UPDATE, DELETE)이므로 반드시 트랜잭션처리 해야 한다.
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		// 자원반납
		close(conn);

		return result;
	}
	
	// 코인 충전
	public int chargeCoin(Member m) {
		Connection conn = getConnection();
		System.out.println("코인충전@서비스 = " + m.getCoin());
		int result = new MemberDao().chargeCoin(conn, m);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 이메일 있는지 확인
	public Member selectEmail(String userEmail) {
		Member loggedInMember = null;

		// DB와 연결
		Connection conn = getConnection();

		loggedInMember = new MemberDao().selectEmail(conn, userEmail);

		// DQL(SELECT)이므로 트랜잭션 처리 하지 않는다.

		// 자원반납
		close(conn);

		return loggedInMember;
	}

	  // 자유게시판 작성글 보기
	  public List<FreeBoard> selectFreeBoard(String userId){
		  Connection conn = getConnection();
		  List<FreeBoard> list = new MemberDao().selectFreeBoard(conn, userId);
		  close(conn);
		  return list;
	  }
	
	  // 공략게시판 작성글 보기
	  public List<SolveBoard> selectSolveBoard(String userId){
		  Connection conn = getConnection();
		  List<SolveBoard> list = new MemberDao().selectSolveBoard(conn, userId);
		  close(conn);
		  return list;
	  }

	  // 공지게시판 작성글 보기
	public List<Notice> selectNoticeBoard(int noticeNo) {
		Connection conn = getConnection();
		  List<Notice> list = new MemberDao().selectNoticeBoard(conn, noticeNo);
		  close(conn);
		  return list;
	}


}