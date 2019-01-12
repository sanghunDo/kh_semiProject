package semi.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Properties;

import semi.member.model.vo.Member;

import static semi.common.JDBCTemplate.*;

public class MemberDao {
	Properties prop = new Properties();

	public MemberDao() {
		// (WebContent/WEB-INF/)classes 폴더에서부터 시작하여 해당파일까지의 절대 경로
		// WEB-INF 폴더 아래에 넣어두면 서버에서 서비스 할 때 외부에서 URL로 직접 접근할 수 없게 되어 보안성이 좋다.
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// 회원 유무 여부 확인
	public int loginCheck(Connection conn, Member m) {
		// -1은 없는 아이디
		int result = -1;

		// DB로 SQL문 요청하기 위해 객체 생성
		PreparedStatement pstmt = null;

		// SELECT문을 통해서 데이터를 가져온다면 ResultSet 객체에 그 데이터를 저장해야 한다.
		ResultSet rset = null;
		String query = prop.getProperty("loginCheck");
		System.out.println("멤버다오 비밀번호 체크 : "+m.getUserPassword());

		try {
			// 1. Statement객체 생성 및 미완성쿼리문 완성
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPassword());
			pstmt.setString(3, m.getUserId());

			// 2. 쿼리문 실행 : DQL(SELECT) 이므로 excuteQuery()
			rset = pstmt.executeQuery();

			// 3. 결과 변수 result에 담기
			if (rset.next()) { // 하나의 결과값만 돌려주면 되기 때문에 while문 대신 if문 작성
				result = rset.getInt("logincheck"); // 컬럼명
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 4. 자원반납
			close(rset);
			close(pstmt);
		}

		return result;

	}
	
	// 이메일 유무 확인
	public int emailCheck(Connection conn, Member m) {
		int result = -1;
		
		// DB로 SQL문 요청하기 위해 객체 생성
		PreparedStatement pstmt = null;

		// SELECT문을 통해서 데이터를 가져온다면 ResultSet 객체에 그 데이터를 저장해야 한다.
		ResultSet rset = null;

		String query = prop.getProperty("emailCheck");

		try {
			// 1. Statement객체 생성 및 미완성쿼리문 완성
			pstmt = conn.prepareStatement(query);

			// 쿼리문 미완성
			pstmt.setString(1, m.getUserEmail());

			// 2. 쿼리문 실행 : DQL(SELECT) 이므로 excuteQuery()
			rset = pstmt.executeQuery();
			
			// 3. 결과 m에 담기
			if (rset.next()) { // 하나의 결과값만 돌려주면 되기 때문에 while문 대신 if문 작성
				result = rset.getInt("emailcheck"); // 컬럼명
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원반납
			close(rset);
			close(pstmt);
		}

		return result;
	}
	
	// 해당 이메일 회원 아이디 찾기
	public Member findIdByEmail(Connection conn, String userEmail) {
		Member m = null;
		
		// DB로 SQL문 요청하기 위해 객체 생성
		PreparedStatement pstmt = null;

		// SELECT문을 통해서 데이터를 가져온다면 ResultSet 객체에 그 데이터를 저장해야 한다.
		ResultSet rset = null;

		String query = prop.getProperty("findIdByEmail");

		try {
			// 1. Statement객체 생성 및 미완성쿼리문 완성
			pstmt = conn.prepareStatement(query);

			// 쿼리문 미완성
			pstmt.setString(1, userEmail);

			// 2. 쿼리문 실행 : DQL(SELECT) 이므로 excuteQuery()
			rset = pstmt.executeQuery();
			
			// 3. 결과 m에 담기
			if (rset.next()) { // 다음 행이 있다면 실행
				m = new Member();
				m.setUserId(rset.getString("userId"));
				m.setUserEmail(rset.getString("userEmail"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원반납
			close(rset);
			close(pstmt);
		}

		return m;
		
	}
	

	// 회원정보보기
	public Member selectOne(Connection conn, String userId) {
		Member loggedInMember = null;

		// DB로 SQL문 요청하기 위해 객체 생성
		PreparedStatement pstmt = null;

		// SELECT문을 통해서 데이터를 가져온다면 ResultSet 객체에 그 데이터를 저장해야 한다.
		ResultSet rset = null;

		String query = prop.getProperty("selectOne");

		try {
			// 1. Statement객체 생성 및 미완성쿼리문 완성
			pstmt = conn.prepareStatement(query);

			// 쿼리문 미완성
			pstmt.setString(1, userId);

			// 2. 쿼리문 실행 : DQL(SELECT) 이므로 excuteQuery()
			rset = pstmt.executeQuery();
			
			// 3. 결과 loggedInMember에 담기
			while (rset.next()) { // 다음 행이 있다면 실행
				loggedInMember = new Member();
				loggedInMember.setUserId(rset.getString("userid"));
				loggedInMember.setUserPassword(rset.getString("userpassword"));
				loggedInMember.setUserEmail(rset.getString("useremail"));
				loggedInMember.setUserProfileOriginalFile(rset.getString("userprofileoriginalfile"));
				loggedInMember.setUserProfileRenamedFile(rset.getString("userprofilerenamedfile"));
				loggedInMember.setCoin(rset.getInt("coin"));
				loggedInMember.setHintPaper(rset.getInt("hintpaper"));
				loggedInMember.setEnrollDate(rset.getDate("enrolldate"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원반납
			close(rset);
			close(pstmt);
		}

		return loggedInMember;
	}

	// 로그인 기록
	public int insertMemberLogger(Connection conn, String userId, String status, String ip) {
		int result = 0;

		// DB로 SQL문 요청하기 위해 객체 생성
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertMemberLogger");

		try {
			// 1. Statement객체 생성
			pstmt = conn.prepareStatement(query);

			// 쿼리문 미완성
			pstmt.setString(1, userId);
			pstmt.setString(2, status);
			pstmt.setString(3, ip);

			// 2. 쿼리문 실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			// DB에 가서 쿼리문 실행. 성공하면 status 1, 실패하면 0
			// DML : INSERT, UPDATE, DELETE => excuteUpdate()
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertMember(Connection conn, Member member) {
		int result = 0;

		// DB로 SQL문 요청하기 위해 객체 생성
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertMember");

		try {
			// 1. Statement객체 생성
			pstmt = conn.prepareStatement(query);

			// 쿼리문 미완성
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPassword());
			pstmt.setString(3, member.getUserEmail());
			pstmt.setString(4, member.getUserProfileOriginalFile());
			pstmt.setString(5, member.getUserProfileRenamedFile());

			// 2. 쿼리문 실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			// DML : INSERT, UPDATE, DELETE => excuteUpdate()
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원반납
			close(pstmt);
		}

		return result;
	}

	public int updateMember(Connection conn, Member member) {
		int result = 0;

		// DB로 SQL문 요청하기 위해 객체 생성
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMember");

		try {
			// 1. Statement객체 생성
			pstmt = conn.prepareStatement(query);

			// 쿼리문 미완성
			pstmt.setString(1, member.getUserEmail());
			pstmt.setString(2, member.getUserProfileOriginalFile());
			pstmt.setString(3, member.getUserProfileRenamedFile());
			pstmt.setString(4, member.getUserId());

			// 2. 쿼리문 실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			// DML : INSERT, UPDATE, DELETE => excuteUpdate()
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int deleteMember(Connection conn, String userId) {
		int result = 0;
		
		// DB로 SQL문 요청하기 위해 객체 생성
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("deleteMember"); 

		try {
			// 1. Statement객체 생성
			pstmt = conn.prepareStatement(query);
			
			//쿼리문 미완성
			pstmt.setString(1, userId);
			
			// 2. 쿼리문 실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			// DML : INSERT, UPDATE, DELETE => excuteUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}


	public int updatePassword(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updatePassword");
		
		try {
			// 1. Statement객체 생성
			pstmt = conn.prepareStatement(query);
			
			// 미완성된 쿼리문
			pstmt.setString(1, m.getUserPassword());
			pstmt.setString(2, m.getUserId());
			System.out.println("멤버다오 업데이트 패스워드 : "+m.getUserPassword());
			
			// 2. 쿼리문 실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			// DML : INSERT, UPDATE, DELETE => excuteUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	


	public String getSha512(String userPassword) {
		/**
		 * MessageDigest 클래스에는 update() 메소드가 있는데, 
		 * 이 메소드를 호출할때마다 객체 내에 저장된 digest 값이 계속해서 갱신이됩니다. 
		 * 최종적으로 digest() 메서드를 호출하면 그 값을 가져올 수 있습니다.
		 */
		System.out.println("@MemberDao getSha512 : " + userPassword);
		String encUserPassword = null;
		MessageDigest md = null;
		
		// 1. 암호화객체생성 SHA-512방식
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		// 2. 사용자가 입력한 패스워드(userPassword)를 바이트배열로 변환
		byte[] bytes = userPassword.getBytes(Charset.forName("UTF-8"));
		
		// 3. md객체에 바이트배열전달해서 갱신
		md.update(bytes);
		
		// 4. 암호화처리(return byte[])
		byte[] encBytes = md.digest();
		
		// 5. Base64인코더를 사용해서 암호화된 바이트배열 => 문자열 변환
		// Base64 인코딩 : ByteArray를 64개의 문자로 이루어진 문자열로 변환하는 방법
		encUserPassword = Base64.getEncoder().encodeToString(encBytes);
		// System.out.println("암호화 후@MemberDao : " + encUserPassword);
		
		return encUserPassword;
	}




}
