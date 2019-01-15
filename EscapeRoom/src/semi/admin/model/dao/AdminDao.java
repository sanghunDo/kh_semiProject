package semi.admin.model.dao;

import static semi.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import semi.admin.model.vo.ReportBoard;
import semi.admin.model.vo.ReportBoardComment;
import semi.board.free.model.vo.FreeBoard;
import semi.member.model.vo.Member;

public class AdminDao {
   private Properties prop = new Properties();
   
   public AdminDao() {
      // (WebContent/WEB-INF/)classes 폴더에서부터 시작하여 해당파일까지의 절대 경로
      // WEB-INF 폴더 아래에 넣어두면 서버에서 서비스 할 때 외부에서 URL로 직접 접근할 수 없게 되어 보안성이 좋다.
      String fileName = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
      
      try {
         prop.load(new FileReader(fileName));
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
   }
   
   // 로그인 여부 확인
   public int loginCheck(Connection conn, Member m) {
	   	// -1: 없는 아이디
		int result = -1;
		// DB로 SQL 요청하는 객체문 생성
		PreparedStatement pstmt = null;
		// SELECT문을 통해서 가져온 데이터를 ResultSet 객체에 저장
		ResultSet rset = null;
		// PROPERTIES 파일에서 해당 SQL문을 읽어오기
		String query = prop.getProperty("loginCheck");
		System.out.println("AdminDao 로그인 체크 : "+m.getUserPassword());
		
		try {
			//1. statement 객체 생성 및 미완성 쿼리문 완성
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPassword());
			pstmt.setString(3, m.getUserId());
			
			//2. 쿼리문 실행: SELECT문은 executeQuery()
			rset = pstmt.executeQuery();
			
			//3.결과 변수를 result에 담기
			if(rset.next()) { // 하나의 결과이므로 while 대신 if 사용
				result = rset.getInt("logincheck");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			close(rset);
			close(pstmt);
			
		}
		
		return result;
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
         rset = pstmt.executeQuery();
         
         // 실행 후 결과를 m에 담기
         while(rset.next()) { // 결과가 여러 개라면 while문 사용
        	m = new Member();
            m.setUserId(rset.getString("userid"));
            m.setUserPassword(rset.getString("userpassword"));
            m.setUserEmail(rset.getString("useremail"));
            m.setUserProfileOriginalFile(rset.getString("userprofileoriginalfile"));
            m.setUserProfileRenamedFile(rset.getString("userProfileRenamedFile"));
            m.setCoin(rset.getInt("coin"));
            m.setHintPaper(rset.getInt("hintpaper"));
            m.setEnrollDate(rset.getDate("enrolldate"));
            
         }
         
      } catch (Exception e) {
         e.printStackTrace();
      } finally  {
         close(rset);
         close(pstmt);
      }
      
      return m;
   }
   
   // 관리자용 회원 정보 수정하기
   public int updateMember(Connection conn, Member m) {
	   int result = 0;
	   PreparedStatement pstmt = null;
	   String query = prop.getProperty("updateMember");
	   
	   try {
		   pstmt = conn.prepareStatement(query);
		   
		   pstmt.setString(1, m.getUserId());
		   pstmt.setString(2, m.getUserEmail());
		   pstmt.setString(3, m.getUserProfileOriginalFile());
		   pstmt.setString(4, m.getUserProfileRenamedFile());
		   
		   // UPDATE문이므로 executeUpdate() 사용
		   result = pstmt.executeUpdate();
		   
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   close(pstmt);
	   }

	   return result;
   }
   
   // 관리자용 비밀번호 수정하기
   public int updatePassword(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updatePassword");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, m.getUserPassword());
			pstmt.setString(2, m.getUserId());
			System.out.println("AdminDao updatePassword: " + m.getUserPassword());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
   
   // 관리자용 회원 삭제
   public int deleteMember(Connection conn, String userId) {
	   int result = 0;
	   PreparedStatement pstmt = null;
	
	   String query = prop.getProperty("deleteMember");
	
	   try {
		   pstmt = conn.prepareStatement(query);
		
		   pstmt.setString(1, userId);
		
		   result = pstmt.executeUpdate();
		   
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } 
	
	   return result;
   	}
   
   
   // 관리자용 전체 회원 목록 보기
   public List<Member> selectMemberList(Connection conn) {
      List<Member> list = new ArrayList<Member>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = prop.getProperty("selectMemberList");
      try {
         // 쿼리문 완성하기
         pstmt = conn.prepareStatement(query);
         
         // 쿼리 실행
         rset = pstmt.executeQuery();
         
         // 실행 후 결과를 list에 담기
         while(rset.next()) {
            Member m = new Member();
            m.setUserId(rset.getString("userid"));
            m.setUserPassword(rset.getString("userpassword"));
            m.setUserEmail(rset.getString("useremail"));
            m.setUserProfileOriginalFile("userProfileOriginalFile");
            m.setUserProfileRenamedFile("userProfileRenamedFile");
            m.setCoin(rset.getInt("coin"));
            m.setHintPaper(rset.getInt("hintpaper"));
            m.setEnrollDate(rset.getDate("enrolldate"));
            
            list.add(m);
            }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return list;
   }
   
   // 관리자용 전체 회원수 보기
   public int selectMemberCount(Connection conn) {
      PreparedStatement pstmt = null;
      int totalContent = 0;
      ResultSet rset = null;
      String query = prop.getProperty("selectMemberCount");
      
      try {
         pstmt = conn.prepareStatement(query);
         rset = pstmt.executeQuery();
         if(rset.next()) {
            totalContent = rset.getInt("cnt");
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
         
      }
      
      return totalContent;
   }
   
   // 아이디로 회원 검색
   public List<Member> searchByUserId(Connection conn, String searchKeyword, int cPage, int numPerPage) {
	   List<Member> list = new ArrayList<Member>();
	   PreparedStatement pstmt = null;
	   ResultSet rset = null;
	   String query = prop.getProperty("selectMemberByUserIdPaging");
	   
	   try {
		   pstmt = conn.prepareStatement(query);
		   pstmt.setString(1, "%" + searchKeyword + "%");
		   pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
		   pstmt.setInt(3, cPage * numPerPage);
		   
		   rset = pstmt.executeQuery();
		   
	         while(rset.next()) {
	        	 Member m = new Member();
	             m.setUserId(rset.getString("userid"));
	             m.setUserPassword(rset.getString("userpassword"));
	             m.setUserEmail(rset.getString("useremail"));
	             m.setUserProfileOriginalFile(rset.getString("userprofileoriginalfile"));
	             m.setUserProfileRenamedFile(rset.getString("userProfileRenamedFile"));
	             m.setCoin(rset.getInt("coin"));
	             m.setHintPaper(rset.getInt("hintpaper"));
	             m.setEnrollDate(rset.getDate("enrolldate"));
	             list.add(m);
	          }
		   
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   close(rset);
		   close(pstmt);
	   }
	   
	   return list;
   }
   
   // 이메일로 회원 검색
   public List<Member> searchByUserEmail(Connection conn, String searchKeyword, int cPage, int numPerPage) {
	   List<Member> list = new ArrayList<Member>();
	   PreparedStatement pstmt = null;
	   ResultSet rset = null;
	   String query = prop.getProperty("selectMemberByUserEmailPaging");
	   
	   try {
		   pstmt = conn.prepareStatement(query);
		   pstmt.setString(1, "%" + searchKeyword + "%");
		   pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
		   pstmt.setInt(3, cPage * numPerPage);
		   
		   rset = pstmt.executeQuery();
		   
	         while(rset.next()) {
	        	 Member m = new Member();
	             m.setUserId(rset.getString("userid"));
	             m.setUserPassword(rset.getString("userpassword"));
	             m.setUserEmail(rset.getString("useremail"));
	             m.setUserProfileOriginalFile(rset.getString("userprofileoriginalfile"));
	             m.setUserProfileRenamedFile(rset.getString("userProfileRenamedFile"));
	             m.setCoin(rset.getInt("coin"));
	             m.setHintPaper(rset.getInt("hintpaper"));
	             m.setEnrollDate(rset.getDate("enrolldate"));
	             list.add(m);
	          }
		   
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   close(rset);
		   close(pstmt);
	   }
	   
	   return list;
   }
   
   // 아이디로 회원검색 페이지바
   public int selectMemberCountByUserId(Connection conn, String searchKeyword) {
		PreparedStatement pstmt = null;
		int totalContent = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectMemberCountByUserId");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+searchKeyword+"%");
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalContent = rset.getInt("cnt");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContent;
	}
   
   // 이메일로 회원검색 페이지바
   public int selectMemberCountByUserEmail(Connection conn, String searchKeyword) {
		PreparedStatement pstmt = null;
		int totalContent = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectMemberCountByUserEmail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+searchKeyword+"%");
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalContent = rset.getInt("cnt");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContent;
	}
	   
   // 제목으로 게시글 검색시 목록 보여주기
   public List selectBoardByTitle(Connection conn) {
	   List list = new ArrayList();
	   PreparedStatement pstmt = null;
	   ResultSet rset = null;
	   String query = prop.getProperty("select * from board where posttitle = ?");
	   
	   try {
		   pstmt = conn.prepareStatement(query);
		   
		   while(rset.next()) {
	        	 FreeBoard fb = new FreeBoard();
	             fb.getPostNo();
	         	 fb.getPostTitle();
	         	 fb.getPostWriter();
	         	 fb.getPostContent();
	         	 fb.getPostOriginalFile();
	         	 fb.getPostRenamedFile();
	         	 fb.getPostDate();
	         	 fb.getPostLike();
	         	 fb.getPostDislike();
	         	 fb.getPostReadCount();
	             list.add(fb);
	          }

	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   close(rset);
		   close(pstmt);
	   }
	   
	   return list;
   }
   
   // 제목으로 검색시 페이지바
   
   /// 내용으로 게시글 검색시 목록 보여주기
   public List selectBoardByContent(Connection conn) {
      List list = new ArrayList();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = prop.getProperty("select * from board where postcontent = ?");
      
      try {
		   pstmt = conn.prepareStatement(query);
		   
		   while(rset.next()) {
	        	 FreeBoard fb = new FreeBoard();
	             fb.getPostNo();
	         	 fb.getPostTitle();
	         	 fb.getPostWriter();
	         	 fb.getPostContent();
	         	 fb.getPostOriginalFile();
	         	 fb.getPostRenamedFile();
	         	 fb.getPostDate();
	         	 fb.getPostLike();
	         	 fb.getPostDislike();
	         	 fb.getPostReadCount();
	             list.add(fb);
	          }
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            close(rset);
            close(pstmt);
         }
      
      return list;
   }
   
   // 내용으로 검색시 페이지바
      
   // 게시글 제목 & 내용으로 검색시 게시글 목록 보여주기
   public List selectBoardByTitleAndContent(Connection conn) {
	   List list = new ArrayList();
	   PreparedStatement pstmt = null;
	   ResultSet rset = null;
	   String query = prop.getProperty("select * from board where posttitle and postcontent = ?");
	   
	      try {
			   pstmt = conn.prepareStatement(query);
			   
			   while(rset.next()) {
		        	 FreeBoard fb = new FreeBoard();
		             fb.getPostNo();
		         	 fb.getPostTitle();
		         	 fb.getPostWriter();
		         	 fb.getPostContent();
		         	 fb.getPostOriginalFile();
		         	 fb.getPostRenamedFile();
		         	 fb.getPostDate();
		         	 fb.getPostLike();
		         	 fb.getPostDislike();
		         	 fb.getPostReadCount();
		             list.add(fb);
		          }
	         } catch (SQLException e) {
	            e.printStackTrace();
	         } finally {
	            close(rset);
	            close(pstmt);
	         }
	      
      return list;
   }
   
   // 게시글 제목 & 내용으로 검색시 페이지바
   
   // 댓글로 검색시 게시글 목록 보여주기
   public List selectBoardByComment(Connection conn) {
	   List list = new ArrayList();
	   PreparedStatement pstmt = null;
	   ResultSet rset = null;
	   String query = prop.getProperty("select * from board_comment where commentcontent = ?");
	   
	      try {
			   pstmt = conn.prepareStatement(query);
			   
			   while(rset.next()) {
		        	 FreeBoard fb = new FreeBoard();
		             fb.getPostNo();
		         	 fb.getPostTitle();
		         	 fb.getPostWriter();
		         	 fb.getPostContent();
		         	 fb.getPostOriginalFile();
		         	 fb.getPostRenamedFile();
		         	 fb.getPostDate();
		         	 fb.getPostLike();
		         	 fb.getPostDislike();
		         	 fb.getPostReadCount();
		             list.add(fb);
		          }
	         } catch (SQLException e) {
	            e.printStackTrace();
	         } finally {
	            close(rset);
	            close(pstmt);
	         }
	      
      return list;
   }
   
   // 댓글로 검색시 페이지바
   
   // 작성자로 검색시 게시글 목록 보여주기
   public List selectBoardByUser(Connection conn) {
	   List list = new ArrayList();
	   PreparedStatement pstmt = null;
	   ResultSet rset = null;
	   String query = prop.getProperty("select * from board where postwriter = ?");
	   
	      try {
			   pstmt = conn.prepareStatement(query);
			   
			   while(rset.next()) {
		        	 FreeBoard fb = new FreeBoard();
		             fb.getPostNo();
		         	 fb.getPostTitle();
		         	 fb.getPostWriter();
		         	 fb.getPostContent();
		         	 fb.getPostOriginalFile();
		         	 fb.getPostRenamedFile();
		         	 fb.getPostDate();
		         	 fb.getPostLike();
		         	 fb.getPostDislike();
		         	 fb.getPostReadCount();
		             list.add(fb);
		          }
	         } catch (SQLException e) {
	            e.printStackTrace();
	         } finally {
	            close(rset);
	            close(pstmt);
	         }
	      
      return list;
   }
   
   // 작성자로 검색시 페이지바
      
   // 관리자용 신고 게시글 목록 보여주기
   public List<ReportBoard> selectReportBoard(Connection conn) {
	   List<ReportBoard> list = null;
	   PreparedStatement pstmt = null;
	   ResultSet rset = null;
	   String query = prop.getProperty("selectReportBoard");
	   
	   try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				ReportBoard rb = new ReportBoard();
				
				rb.setCategory(rset.getString("category"));
				rb.setPostNo(rset.getInt("postNo"));
				rb.setPostTitle(rset.getString("postTitle"));
				rb.setPostWriter(rset.getString("postWriter"));
				rb.setReason(rset.getString("reason"));
				rb.setUserComment(rset.getString("userComment"));
				
				list.add(rb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
   
   // 관리자용 신고 게시글 상세보기
   public ReportBoard selectReportOne(Connection conn, int postNo) {
	      ReportBoard rb = null;
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      String query = prop.getProperty("selectReportOne");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, postNo);
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) { 
			rb = new ReportBoard();
	            rb.setCategory(rset.getString("category"));
	            rb.setPostNo(rset.getInt("postno"));
	            rb.setPostTitle(rset.getString("posttitle"));
	            rb.setPostWriter(rset.getString("postwriter"));
	            rb.setReason(rset.getString("reason"));
	            rb.setUserComment(rset.getString("usercomment"));
	            
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally  {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return rb;
	  }
      
   // 관리자용 신고 댓글 목록 보여주기
   public List<ReportBoardComment> selectReportBoardCmt(Connection conn) {
	   List<ReportBoardComment> list = null;
	   PreparedStatement pstmt = null;
	   ResultSet rset = null;
	   String query = prop.getProperty("selectReportBoardCmt");
		
	   try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				ReportBoardComment rbc = new ReportBoardComment();
				
				rbc.setCategory(rset.getString("category"));
				rbc.setPostNo(rset.getInt("postNo"));
				rbc.setCommentNo(rset.getInt("commentNo"));
				rbc.setCommentContent(rset.getString("commentContent"));
				rbc.setCommentWriter(rset.getString("commentWriter"));
				rbc.setReason(rset.getString("reason"));
				rbc.setUserComment(rset.getString("userComment"));
				
				list.add(rbc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
   
   // 관리자용 신고 댓글 상세보기
   public ReportBoardComment selectReportBoardCmtOne(Connection conn, int postNo) {
	   	  ReportBoardComment rbc = null;
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      String query = prop.getProperty("selectReportBoardCmtOne");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, postNo);
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) { 
			rbc = new ReportBoardComment();
	            rbc.setCategory(rset.getString("category"));
	            rbc.setPostNo(rset.getInt("postno"));
	            rbc.setCommentNo(rset.getInt("commentno"));
	            rbc.setCommentContent(rset.getString("commentcontent"));
	            rbc.setCommentWriter(rset.getString("commentwriter"));
	            rbc.setReason(rset.getString("reason"));
	            rbc.setUserComment(rset.getString("usercomment"));
	            
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally  {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return rbc;
	  }
   
   public List<ReportBoard> selectReportByTitle(Connection conn) {
	   List<ReportBoard> list = new ArrayList<ReportBoard>();
	   return list;
   }

   // 관리자용 신고된 게시글 삭제
   public int deleteReportBoard(int postNo) {
	   int result = 0;
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   String query = "delete from board_free where postno=?";
		
	   try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"escape_if_you_can",  //DB 계정 아이디 
					"escape_if_you_can"); //DB 계정 비밀번호
						
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			
			result = pstmt.executeUpdate();	
			
			if(result >0) {
				commit(conn);
			}
		      else {
		    	  rollback(conn);
		      }
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	
		return result;
	}
  
   // 관리자용 신고된 댓글 삭제
   public int deleteReportCmt(int postNo) {
	   return 0;
   }
   
}