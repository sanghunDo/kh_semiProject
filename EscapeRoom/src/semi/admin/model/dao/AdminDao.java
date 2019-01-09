package semi.admin.model.dao;

import static semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import semi.member.model.vo.Member;

public class AdminDao {
   private Properties prop = new Properties();
   
   public AdminDao() {
      // (WebContent/WEB-INF/)classes 폴더에서부터 시작하여 해당파일까지의 절대 경로
      // WEB-INF 폴더 아래에 넣어두면 서버에서 서비스 할 때 외부에서 URL로 직접 접근할 수 없게 되어 보안성이 좋다.
      String fileName = AdminDao.class.getResource("/sql/member/member-query.properties").getPath();
      
      try {
         prop.load(new FileReader(fileName));
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
   }
   
   // 관리자용 회원 정보 상세보기
   public Member selectOne(Connection conn, String userId) {
      Member m = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = prop.getProperty("selectOne");
      
      try {
         pstmt = conn.prepareStatement(query);
         
         pstmt.setString(1, userId);
         
         // 쿼리 실행
         rset = pstmt.executeQuery();
         
         // 실행 후 결과를 m에 담기
         if(rset.next()) {
            m.setUserId("userid");
            m.setUserPassword("userPassword");
            m.setUserEmail("email");
            m.setUserProfileOriginalFile(rset.getString("userprofileoriginalfile"));
            m.setUserProfileOriginalFile("userProfileOriginalFile");
            m.setUserProfileRenamedFile("userProfileRenamedFile");
            m.setEnrollDate(rset.getDate("enrolldate"));
         }
         
      } catch (Exception e) {
         e.printStackTrace();
      } finally  {
         // 자원 반납
         close(rset);
         close(conn);
      }
      
      return m;
   }
   
   // 관리자용 전체 회원 목록 보기
   public List<Member> selectMemberList(Connection conn, int cPage, int numPerPage) {
      List<Member> list = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = prop.getProperty("selectMemberListByPaging");
      try {
         // 쿼리문 완성하기
         pstmt = conn.prepareStatement(query);
         int startRnum = (cPage-1)*numPerPage+1;
         int endRnum = cPage*numPerPage;
         System.out.println(startRnum);
         System.out.println(endRnum);
         pstmt.setInt(1, startRnum);
         pstmt.setInt(2, endRnum);
         
         // 쿼리 실행
         rset = pstmt.executeQuery();
         
         list = new ArrayList<>();
         
         // 실행 후 결과를 list에 담기
         while(rset.next()) {
            Member m = new Member();
            m.setUserId(rset.getString("userid"));
            m.setUserPassword(rset.getString("userpassword"));
            m.setUserEmail(rset.getString("useremail"));
            m.setUserProfileOriginalFile("userProfileOriginalFile");
            m.setUserProfileRenamedFile("userProfileRenamedFile");
            m.setEnrollDate(rset.getDate("enrolldate"));
             
            list.add(m);
            }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         // 자원 반납
         close(rset);
         close(pstmt);
      }
      
      return list;
   }
   
   //관리창 유저정보 토탈 회원수
   public int selectMemberCount(Connection conn) {
      PreparedStatement pstmt = null;
      int totalContent = 0;
      ResultSet rset = null;
      String query = prop.getProperty("selectMemberCount");
      
      try {
         pstmt=conn.prepareStatement(query);
         rset = pstmt.executeQuery();
         if(rset.next()) {
            totalContent = rset.getInt("cnt");
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
         
      }
      
      return totalContent;
   }
      
   // 회원 이메일로 검색시 목록 보여주기
   public List<Member> selectMemberListByEmail(Connection conn) {
      List<Member> memberListByEmail = new ArrayList<Member>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = prop.getProperty("select * from member where useremail = ?");
      
      try {
         // 쿼리문 완성하기
         pstmt = conn.prepareStatement(query);
         Member m = new Member();
      
         // 쿼리문 실행하기
         rset = pstmt.executeQuery();
      
         // 실행 후 결과를 list에 담기
         while(rset.next()) {
            m.setUserId(rset.getString("memberId"));
            m.setUserPassword(rset.getString("password"));
            m.setUserEmail(rset.getString("email"));
            m.setEnrollDate(rset.getDate("enrolldate"));
            memberListByEmail.add(m);
         }
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            // 자원 반납
            close(rset);
            close(pstmt);
         }
      
      return memberListByEmail;
   }
   
   // 게시글 제목 & 내용으로 검색시 목록 보여주기
   public List selectArticle() {
      List articleList = new ArrayList();
      return articleList;
   }
   
   // 댓글 검색시 목록 보여주기
   public List selectComment() {
      List commentList = new ArrayList();
      return commentList;
   }
   
}